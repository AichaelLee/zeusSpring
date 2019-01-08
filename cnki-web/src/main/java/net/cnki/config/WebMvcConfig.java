package net.cnki.config;

import net.cnki.common.DateConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 通用Bean注册
 * @author: lizhizhong
 * CreatedDate: 2018/11/26.
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new DateConverter());
    }

    @Bean
    public ExecutorService executorService() {
        return Executors.newCachedThreadPool();
    }

    /**
     * 权限重置Mapper
     * @return 简单权限映射器
     */
    @Bean
    public SimpleAuthorityMapper simpleAuthorityMapper(){
        return  new SimpleAuthorityMapper();
    }

}
