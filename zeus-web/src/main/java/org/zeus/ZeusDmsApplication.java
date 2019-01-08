package org.zeus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.ConfigureRedisAction;
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

    /**
     * 这段配置是当程序运行在云端的redis的时候，为了安全，云厂商会关闭config
     * 命令，所以在这设置一下，如果是本地部署redis的话，这段配置可以去掉
     * @return
     */
    @Bean
    public ConfigureRedisAction configureRedisAction() {
        return ConfigureRedisAction.NO_OP;
    }

}

