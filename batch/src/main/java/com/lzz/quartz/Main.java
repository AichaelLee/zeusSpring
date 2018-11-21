package com.lzz.quartz;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

    private static final String SPRING_CONFIG_FILE = "classpath:applicationContext.xml";

    public static void main(String[] args) throws Exception {
        ConfigurableApplicationContext context = new ClassPathXmlApplicationContext(SPRING_CONFIG_FILE);
    }
}
