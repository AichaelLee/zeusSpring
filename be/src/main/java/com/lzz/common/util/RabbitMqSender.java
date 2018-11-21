package com.lzz.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class RabbitMqSender {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AmqpTemplate rabbitTemplate;

    public void sendMailOnBatch(Map<String, Object> context) {
        if (logger.isDebugEnabled()) {
            logger.debug("send mail content to rabbitmq mail_queue {}", context);
        }
        this.rabbitTemplate.convertAndSend("mail", context);
    }
}
