package org.zeus.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.springframework.stereotype.Component;
import org.zeus.bean.RespBean;
import org.zeus.service.SecurityMobileUserDetailService;

import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component
public class SmsCodeAuthenticationSecurityConfig extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {


    @Autowired
    private Filter validateCodeFilter;

    @Autowired
    private SecurityMobileUserDetailService userDetailsService;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.addFilterBefore(validateCodeFilter, AbstractPreAuthenticatedProcessingFilter.class);
        //自定义SmsCodeAuthenticationFilter过滤器
        SmsCodeAuthenticationFilter smsCodeAuthenticationFilter = new SmsCodeAuthenticationFilter();
        smsCodeAuthenticationFilter.setAuthenticationManager(http.getSharedObject(AuthenticationManager.class));
        smsCodeAuthenticationFilter.setAuthenticationSuccessHandler(new CustomAuthenticationSuccessHandler());
        smsCodeAuthenticationFilter.setAuthenticationFailureHandler(new CustomAuthenticationFailureHandler());

        //设置自定义SmsCodeAuthenticationProvider的认证器userDetailsService
        SmsCodeAuthenticationProvider smsCodeAuthenticationProvider = new SmsCodeAuthenticationProvider();
        smsCodeAuthenticationProvider.setUserDetailsService(userDetailsService);
        //在UsernamePasswordAuthenticationFilter过滤前执行
        http.authenticationProvider(smsCodeAuthenticationProvider)
            .addFilterAfter(smsCodeAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
    }
    /**
     * 自定义验证成功处理器
     */
    private class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

        @Override
        public void onAuthenticationSuccess(HttpServletRequest req,
                                            HttpServletResponse resp,
                                            Authentication auth) throws IOException {
            resp.setContentType("application/json;charset=utf-8");
            RespBean respBean = null;

            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

                respBean =RespBean.ok("登录成功!",  UserUtils.getCurrentUser());
            // 登录日志记录
            // 数据库中插入操作记录

            ObjectMapper om = new ObjectMapper();
            PrintWriter out = resp.getWriter();
            out.write(om.writeValueAsString(respBean));
            out.flush();
            out.close();
        }
    }

    /**
     * 自定义验证失败处理器
     *
     * **/
    private class CustomAuthenticationFailureHandler implements  AuthenticationFailureHandler{

        @Override
        public void onAuthenticationFailure(HttpServletRequest req,
                                            HttpServletResponse resp,
                                            AuthenticationException e) throws IOException {
            resp.setContentType("application/json;charset=utf-8");

            resp.setStatus(401);
            ObjectMapper om = new ObjectMapper();
            PrintWriter out = resp.getWriter();
            out.write("error!");
            out.flush();
            out.close();
        }

    }
}
