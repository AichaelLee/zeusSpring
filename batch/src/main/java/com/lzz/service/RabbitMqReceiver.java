package com.lzz.service;

import com.lzz.common.util.MailUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.Map;

//@Component
//@RabbitListener(queues = "mail")
public class RabbitMqReceiver {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AmqpTemplate rabbitTemplate;
    @RabbitHandler
    public void process(Map params) throws IOException {
        MailUtil.sendMailByParams(params);
    }
}
