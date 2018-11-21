package com.lzz.common.util;

import com.lzz.common.constant.BatchConstant;
import com.lzz.common.exception.SendMailException;
import com.sendgrid.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 使用sendGrid发送邮件
 *
 */
@Service
public class MailUtil {

    private static final Logger logger = LoggerFactory.getLogger(MailUtil.class);

    private static String SENDGRID_API_KEY;

    /** 发件人 */
    private static String FROM_MAIL_ADDRESS = System.getenv("WW_FROM_MAIL_ADDRESS");


   // private static final String SENDGRID_API_KEY = "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";

    // sendgrid API key
    @Value("${spring.sendgrid.api-key}")
    public void setSendgridApiKey(String key) {
        SENDGRID_API_KEY = key;
    }
    /**
     * 发送邮件
     *
     * @param from 发信人
     * @param toList to list
     * @param ccList cc list
     * @param bccList bcc list
     * @param subject mail的主题
     * @param content mail的内容
     * @throws IOException
     */
    public static int sendMail(String from, List<String> toList, List<String> ccList, List<String> bccList,
            String subject, String content) throws IOException {

        String opName = "MailUtil" + "." + "sendMail";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(BatchConstant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(BatchConstant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String toListString = "";
        String ccListString = "";
        String bccListString = "";

        if (CollectionUtils.isNotEmpty(toList)) {
            toListString = Arrays.toString((String[]) toList.toArray(new String[0]));
        }
        if (CollectionUtils.isNotEmpty(ccList)) {
            ccListString = Arrays.toString((String[]) ccList.toArray(new String[0]));
        }
        if (CollectionUtils.isNotEmpty(bccList)) {
            bccListString = Arrays.toString((String[]) bccList.toArray(new String[0]));
        }

        String logPrefix = logPrefixSb.toString();
        logger.info(BatchConstant.OPERATION_START + " " + logPrefix + " " + BatchConstant.OPERATION_PARAMS + "="
                + "[{" + "from=" + from + ", "
                + "toList=" + toListString + ", "
                + "ccList=" + ccListString + ", "
                + "bccList=" + bccListString + ", "
                + "subject=" + subject + ", "
                + "content=" + content + "}]");
        long start = System.currentTimeMillis();

        if (CollectionUtils.isEmpty(toList)) {
            String logMsg = "status : 400" + ", entity : necessary parameter is missing.";
            logger.error(logMsg);
            throw new SendMailException(logMsg);
        }

        if (StringUtils.isBlank(from) || StringUtils.isBlank(content)) {
            String logMsg = "status : 400" + ", entity : necessary parameter is missing.";
            logger.error(logMsg);
            throw new SendMailException(logMsg);
        }

        // 生成邮件
        SendGrid sg = new SendGrid(new MailUtil().SENDGRID_API_KEY);
        sg.addRequestHeader("X-Mock", "true");

        Request request = new Request();
        Mail email = buildEmail(from, subject, toList, ccList, bccList, content, "text/plain", null, null);

        request.method = Method.POST;
        request.endpoint = "mail/send";
        request.body = email.build();
        Response response = sg.api(request);

        //Status Code Description
        //-----------------------------------------------------------------------
        //      200   No error
        //      201   Successfully created
        //      204   Successfully deleted
        //      400   Bad request
        //      401   Requires authentication
        //      406   Missing Accept header. example: Accept: application/json
        //      429   Too Many Requests
        //      500   Internal server error
        //-----------------------------------------------------------------------
        int statusCode = response.statusCode;
        String logMsg = "status : " + statusCode;
        logger.info(BatchConstant.OPERATION_END + " " + logPrefix + " " + BatchConstant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms " + logMsg
                + " body=" + request.body);
        if (statusCode < 200 || statusCode >= 300) {
            throw new SendMailException(logMsg);
        } else {
            // 发送成功后，把statusCode设为200
            statusCode = 200;
        }

        return statusCode;

    }

    /**
     *邮件发送
     */
    public static int sendMail(List<String> toList, String subject, String text) throws IOException {

        return sendMail(FROM_MAIL_ADDRESS, toList, null, null, subject, text);
    }

    /**
     * 根据参数发送邮件
     *
     * @param params
     * @throws IOException
     */
    public static void sendMailByParams(Map<String, Object> params) throws IOException {

        // 发信人
        String from = (String) params.get("from");

        // 收件人
        List<String> listTo = new ArrayList<>();
        String to = (String) params.get("to");
        if (StringUtils.isNotBlank(to)) {
            String[] toArray = to.split(";", 0);
            for (int i = 0; i < toArray.length; i++) {
                listTo.add(toArray[i]);
            }
        }

        // 邮件 CC
        List<String> listCc = new ArrayList<>();
        String cc = (String) params.get("cc");
        if (StringUtils.isNotBlank(cc)) {
            String[] ccArray = cc.split(";", 0);
            for (int i = 0; i < ccArray.length; i++) {
                listCc.add(ccArray[i]);
            }
        }

        // BCC
        List<String> listBcc = new ArrayList<>();
        String bcc = (String) params.get("bcc");
        if (StringUtils.isNotBlank(bcc)) {
            String[] bccArray = bcc.split(";", 0);
            for (int i = 0; i < bccArray.length; i++) {
                listBcc.add(bccArray[i]);
            }
        }

        // 邮件主题
        String subject = (String) params.get("subject");
        // 邮件内容
        String text = (String) params.get("text");

        sendMail(from, listTo, listCc, listBcc, subject, text);

    }

    /**
     * 生成邮件
     */
    private static Mail buildEmail(String mailAddressFrom, String mailSubject, List<String> mailAddressTo,
            List<String> mailAddressCC, List<String> mailAddressBCC, String mailContent, String contentType,
            String attachmentFileName, String attachmentDataString) {

        Mail mail = new Mail();

        // 送信人
        Email fromEmail = new Email();
        fromEmail.setEmail(mailAddressFrom);
        mail.setFrom(fromEmail);

        Personalization personalization = new Personalization();

        // 设置主题
        personalization.setSubject(mailSubject);
        mail.addPersonalization(personalization);

        // 收信人
        if (CollectionUtils.isNotEmpty(mailAddressTo)) {
            for (String s : mailAddressTo) {
                Email to = new Email();
                to.setEmail(s);
                personalization.addTo(to);
            }
        }

        // CC
        if (CollectionUtils.isNotEmpty(mailAddressCC)) {
            for (String s : mailAddressCC) {
                Email cc = new Email();
                cc.setEmail(s);
                personalization.addCc(cc);
            }
        }

        // BCC
        if (CollectionUtils.isNotEmpty(mailAddressBCC)) {
            for (String s : mailAddressBCC) {
                Email bcc = new Email();
                bcc.setEmail(s);
                personalization.addBcc(bcc);
            }
        }

        // 邮件文本
        Content content = new Content();
        if ("text/html".equals(contentType)) {
            content.setType("text/html");
            content.setValue("<html><body>" + mailContent + "</body></html>");
        } else {
            content.setType("text/plain");
            content.setValue(mailContent);
        }
        mail.addContent(content);

        //添付ファイル
        if (attachmentDataString != null) {
            Attachments attachments = new Attachments();
            attachments.setContent(attachmentDataString);
            attachments.setType("application/pdf");
            attachments.setFilename(attachmentFileName);
            attachments.setDisposition("attachment");
            attachments.setContentId("ContentId001");
            mail.addAttachments(attachments);
        }

        return mail;
    }
}
