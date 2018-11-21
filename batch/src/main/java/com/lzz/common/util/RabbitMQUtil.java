package com.lzz.common.util;
import com.lzz.common.constant.BatchConstant;
import com.rabbitmq.client.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.lang.reflect.Method;
@Deprecated
public class RabbitMQUtil {

    private static final Logger logger = LoggerFactory.getLogger(RabbitMQUtil.class);

    public static String QUEUE_PDF = "PDF";
    public static String QUEUE_HENSACHI = "HENSACHI";
    public static String QUEUE_SENDMAIL = "SendMail";

    /**
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static void consume() {

        final String uri = System.getenv("CLOUDAMQP_URL");

        try {

            // 处理中
            if (uri == null) {
                throw new Exception("");
            }
            logger.info("url is:"+uri);
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

                 //       Object o = context.getBean(clazz);
                        Method method = clazz.getMethod(queue.getMethodName(), queue.getCls());

                        String opName = "RabbitMQUtil.consume";
                        StringBuilder logPrefixSb = new StringBuilder();
                        logPrefixSb.append(BatchConstant.OPERATION_LOG_ID);
                        logPrefixSb.append(" ");
                        logPrefixSb.append(BatchConstant.OPERATION_ID);
                        logPrefixSb.append("=");
                        logPrefixSb.append(opName);

                        String logPrefix = logPrefixSb.toString();
                        logger.info(BatchConstant.OPERATION_START + " " + logPrefix + " " + BatchConstant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");
                        long start = System.currentTimeMillis();
                        // メイン処理
                     //   method.invoke(o, param);

                        logger.info(BatchConstant.OPERATION_END + " " + logPrefix + " " + BatchConstant.OPERATION_DURATION + "="
                                + (System.currentTimeMillis() - start) + "ms" + " " + BatchConstant.OPERATION_PARAMS + "="
                                + "[{" + "className=" + queue.getClassName() + ", "
                                + "methodName=" + queue.getMethodName() + ", "
                                + "cls=" + queue.getCls() + ", "
                                + "param=" + param + ", "
                                + "uri=" + uri + "}]");

                    } catch (Exception e) {

                        e.printStackTrace();

                    } finally {
                        // 确认应答
                        channel.basicAck(envelope.getDeliveryTag(), false);

                        // 拒绝应答
                        //channel.basicReject(envelope.getDeliveryTag(), true);
                    }

                }
            };
            channel.basicConsume(QUEUE_PDF, false, consumer);
        } catch (Exception e) {
            // 发生异常

            e.printStackTrace();

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
     * @author aichaellee
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
