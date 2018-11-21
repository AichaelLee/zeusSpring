package com;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@MapperScan({"com.lzz.mapper"})
@ComponentScan({"com.lzz.common", "com.lzz.entity","com.lzz.learn", "com.lzz.service", "com.lzz.quartz"})
//注意ComponentScan,把所有的包都扫描进去，一开始忽略掉了，导致quartz启动问题
public class BatchApplication implements CommandLineRunner {

    private static final Logger LOG = LoggerFactory.getLogger(BatchApplication.class);

    @Value("${spring.profiles.active}")
    protected  String springProfilesActive;
    @Value("${spring.sendgrid.api-key}")
    private  String SENDGRID_API_KEY;


    public static void main(String[] args) throws Exception {

        SpringApplication.run(BatchApplication.class, args);
    }
    @Override
    public void run(String... args){
        LOG.info("=======================================");
        LOG.info("*****************##########"+SENDGRID_API_KEY);
        LOG.info("App running with active profiles: {}", springProfilesActive);
        LOG.info("=======================================");
    }

}
