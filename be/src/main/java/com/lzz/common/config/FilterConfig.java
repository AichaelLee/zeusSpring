package com.lzz.common.config;

import com.lzz.common.filter.HttpsEnforcer;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.ArrayList;
import java.util.List;
/**
 * 过滤器配置
 * httpsEnforcer 添加https前缀
 * */
@Configuration
public class FilterConfig {
    @Bean
    public FilterRegistrationBean authFilterRegistrationBean() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setName("httpsEnforcer");
        HttpsEnforcer httpsEnforcer = new HttpsEnforcer();
        registrationBean.setFilter(httpsEnforcer);
        registrationBean.setOrder(1);
        List<String> urlList = new ArrayList<String>();
        urlList.add("/*");
        registrationBean.setUrlPatterns(urlList);
        return registrationBean;
    }
}
