package com.lzz.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ConfigurableApplicationContext;

import com.lzz.common.constant.Constant;
import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.QueueingConsumer;
@Deprecated
public class RabbitMQUtil {

    private static final Logger logger = LoggerFactory.getLogger(RabbitMQUtil.class);

    public static String QUEUE_PDF = "PDF";
    public static String QUEUE_HENSACHI = "HENSACHI";
    public static String QUEUE_SENDMAIL = "SendMail";

    /**
     * @param className
     * @param methodName
     * @param cls
     * @param param
     * @throws Exception
     */
    public static void publish(String className, String methodName, Class cls, Object param, String queueName) {

        String uri = System.getenv("CLOUDAMQP_URL");

        String opName = "RabbitMQUtil.publish";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "className=" + className + ", "
                + "methodName=" + methodName + ", "
                + "cls=" + cls + ", "
                + "param=" + param + ", "
                + "uri=" + uri + "}]");
        long start = System.currentTimeMillis();

        try {
            // 実行状況テーブルへの新規登録(状況＝"未処理")
            if (uri == null)
                throw new Exception("");

            ConnectionFactory factory = new ConnectionFactory();
            factory.setUri(uri);
            factory.setRequestedHeartbeat(30000);
            factory.setConnectionTimeout(30000);

            Connection connection = factory.newConnection();
            Channel channel = connection.createChannel();

            channel.queueDeclare(queueName, true, false, false, null); //TODO

            QueueBean queue = new QueueBean();
            queue.setClassName(className);
            queue.setMethodName(methodName);
            queue.setCls(cls);
            queue.setParam(param);
            byte[] bytes = serialize(queue);

            // メイン処理
            channel.basicPublish("", queueName, null, bytes); //TODO

            channel.close();
            connection.close();

        } catch (Exception e) {
            // 実行状況テーブルへの新規登録(状況＝"異常終了")

            e.printStackTrace();

        } finally {
            // 後処理

            logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                    + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                    + "[{" + "className=" + className + ", "
                    + "methodName=" + methodName + ", "
                    + "cls=" + cls + ", "
                    + "param=" + param + ", "
                    + "uri=" + uri + "}]");

        }

    }

    /**
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static void consume(final ConfigurableApplicationContext context) {

        final String uri = System.getenv("CLOUDAMQP_URL");

        try {
            // 実行状況テーブルへの更新(状況＝"処理中")

            if (uri == null)
                throw new Exception("");

            ConnectionFactory factory = new ConnectionFactory();
            factory.setUri(uri);
            factory.setRequestedHeartbeat(30000);
            factory.setConnectionTimeout(30000);

            Connection connection = factory.newConnection();
            final Channel channel = connection.createChannel();
            QueueingConsumer consumer = null;

            channel.queueDeclare(QUEUE_PDF, true, false, false, null);

            consumer = new QueueingConsumer(channel) {
                @SuppressWarnings("rawtypes")
                @Override
                public void handleDelivery(String consumerTag, Envelope envelope,
                        AMQP.BasicProperties properties, byte[] body)
                        throws IOException {
                    try {
                        QueueBean queue = (QueueBean) deserialize(body);
                        Object param = queue.getParam();
                        Class clazz = Class.forName(queue.getClassName());

                        Object o = context.getBean(clazz);
                        Method method = clazz.getMethod(queue.getMethodName(), queue.getCls());

                        String opName = "RabbitMQUtil.consume";
                        StringBuilder logPrefixSb = new StringBuilder();
                        logPrefixSb.append(Constant.OPERATION_LOG_ID);
                        logPrefixSb.append(" ");
                        logPrefixSb.append(Constant.OPERATION_ID);
                        logPrefixSb.append("=");
                        logPrefixSb.append(opName);

                        String logPrefix = logPrefixSb.toString();
                        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");
                        long start = System.currentTimeMillis();
                        // メイン処理
                        method.invoke(o, param);

                        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");

                    } catch (Exception e) {

                        e.printStackTrace();

                    } finally {
                        //確認応答
                        channel.basicAck(envelope.getDeliveryTag(), false);

                        //否定応答
                        //channel.basicReject(envelope.getDeliveryTag(), true);
                    }

                }
            };
            channel.basicConsume(QUEUE_PDF, false, consumer);
        } catch (Exception e) {
            // 実行状況テーブルへの更新(状況＝"異常終了")

            e.printStackTrace();

        } finally {
            // 後処理

        }

    }

    /**
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static void consume2(final ConfigurableApplicationContext context) { //TODO

        final String uri = System.getenv("CLOUDAMQP_URL");

        try {
            // 実行状況テーブルへの更新(状況＝"処理中")

            if (uri == null)
                throw new Exception("");

            ConnectionFactory factory = new ConnectionFactory();
            factory.setUri(uri);
            factory.setRequestedHeartbeat(30000);
            factory.setConnectionTimeout(30000);

            Connection connection = factory.newConnection();
            final Channel channel = connection.createChannel();
            QueueingConsumer consumer = null;

            channel.queueDeclare(QUEUE_HENSACHI, true, false, false, null);

            consumer = new QueueingConsumer(channel) {
                @SuppressWarnings("rawtypes")
                @Override
                public void handleDelivery(String consumerTag, Envelope envelope,
                        AMQP.BasicProperties properties, byte[] body)
                        throws IOException {
                    try {
                        QueueBean queue = (QueueBean) deserialize(body);
                        Object param = queue.getParam();
                        Class clazz = Class.forName(queue.getClassName());

                        Object o = context.getBean(clazz);
                        Method method = clazz.getMethod(queue.getMethodName(), queue.getCls());

                        String opName = "RabbitMQUtil.consume";
                        StringBuilder logPrefixSb = new StringBuilder();
                        logPrefixSb.append(Constant.OPERATION_LOG_ID);
                        logPrefixSb.append(" ");
                        logPrefixSb.append(Constant.OPERATION_ID);
                        logPrefixSb.append("=");
                        logPrefixSb.append(opName);

                        String logPrefix = logPrefixSb.toString();
                        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");
                        long start = System.currentTimeMillis();
                        // メイン処理
                        method.invoke(o, param);

                        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");

                    } catch (Exception e) {

                        e.printStackTrace();

                    } finally {
                        //確認応答
                        channel.basicAck(envelope.getDeliveryTag(), false);

                        //否定応答
                        //channel.basicReject(envelope.getDeliveryTag(), true);
                    }

                }
            };
            channel.basicConsume(QUEUE_HENSACHI, false, consumer);
        } catch (Exception e) {
            // 実行状況テーブルへの更新(状況＝"異常終了")

            e.printStackTrace();

        } finally {
            // 後処理

        }

    }

    /**
     * @param obj
     * @return
     * @throws IOException
     */
    public static byte[] serialize(Object obj) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ObjectOutputStream os = new ObjectOutputStream(out);
        os.writeObject(obj);
        return out.toByteArray();
    }

    /**
     * @param data
     * @return
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public static Object deserialize(byte[] data) throws IOException, ClassNotFoundException {
        ByteArrayInputStream in = new ByteArrayInputStream(data);
        ObjectInputStream is = new ObjectInputStream(in);
        return is.readObject();
    }

    /**
     * @author itec
     *
     */
    public static class QueueBean implements Serializable {
        private String className = null;
        private String methodName = null;
        private Object param = null;
        private Class cls = null;

        public Class getCls() {
            return cls;
        }

        public void setCls(Class cls) {
            this.cls = cls;
        }

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }

        public String getMethodName() {
            return methodName;
        }

        public void setMethodName(String methodName) {
            this.methodName = methodName;
        }

        public Object getParam() {
            return param;
        }

        public void setParam(Object param) {
            this.param = param;
        }
    }
}
