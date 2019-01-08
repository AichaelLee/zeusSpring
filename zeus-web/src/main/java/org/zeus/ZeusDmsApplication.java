package org.zeus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * 2.0的start中默认也有一个spring-boot-autoconfigure-2.0..RELEASE.jar，
 *  如果还引用了activiti的activiti-spring-boot-starter-rest-api.jar包，
 *  需要将两个包中的 SecurityAutoConfiguration.class 都排除，
 */
@SpringBootApplication
@MapperScan({"org.zeus.dmsMapper"})
@ComponentScan({"org.zeus.controller","org.zeus.common","org.zeus.config","org.zeus.service"})
//@EnableCaching
//@EnableRedisHttpSession
public class ZeusDmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZeusDmsApplication.class, args);
	}

}

