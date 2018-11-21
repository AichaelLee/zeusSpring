package com.lzz.service;

import com.lzz.common.util.MessageUtil;
import com.lzz.common.util.RabbitMqSender;
import com.lzz.entity.PasswordResets;
import com.lzz.mapper.PasswordResetsRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class PasswordResetSendMail {

    private static String MAIL_THIS_URL = System.getenv("MAIL_THIS_URL_ADDUSER");
    private static String MAIL_THIS_MAIL = "aichaellee@aichaellee.com";

    private static final Logger logger = LoggerFactory.getLogger(PasswordResetSendMail.class);

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    RabbitMqSender rabbitMq;

    @Autowired
    private PasswordResetsRepository passwordResetsRepository;

    /**
     *
     * */
    public String sendMail(PasswordResets form) {

        // 删除以往的token
        passwordResetsRepository.deleteToken(form);

        // 新token生成
        form.setToken(UUID.randomUUID().toString());

        // 数据库中插入token
        passwordResetsRepository.insertToken(form);
        long currentTime = System.currentTimeMillis();
        currentTime += 24 * 60 * 60 * 1000;
        Date date = new Date(currentTime);
        SimpleDateFormat dateFormat = new SimpleDateFormat(

            "yyyy-MM-dd HH:mm:ss");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));

        // メール送信
        Map<String, Object> mails = new HashMap<>();
        mails.put("from", messageUtil.getMessage("PWRESET_MAIL_FROM"));
        mails.put("to", form.getEmail());
        mails.put("subject", messageUtil.getMessage("PWRESET_MAIL_SUBJECT"));
        mails.put("text",
            messageUtil.getMessage("PWRESET_MAIL_TEXT", form.getEmail(), dateFormat.format(date), MAIL_THIS_URL + form.getToken(), MAIL_THIS_MAIL));
       // rabbitMq.sendMailOnBatch(mails);
        logger.info("send mail on batch end");
        // resultBean.getModelBeanMap().put("success", true);
        return "success";
    }

    public void sendSuccessMail(){
        // メール送信
        Map<String, Object> mails = new HashMap<>();
        mails.put("from", messageUtil.getMessage("PWRESET_MAIL_FROM"));
        mails.put("to", "toMail");
        mails.put("subject", "账号注册成功！");
        mails.put("text",
           "账号注册成功，请您登录！");
        // rabbitMq.sendMailOnBatch(mails);
        logger.info("send success mail on batch end");

    }

}
