package com.lzz.common.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lzz.common.util.UserDetails;
import com.lzz.service.GetUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.Http401AuthenticationEntryPoint;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;

import java.io.PrintWriter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private GetUserService getUserService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Bean
    public BCryptPasswordEncoder setPasswordEncoder() {
        return new BCryptPasswordEncoder(11);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {

        // 设置免登录的静态资源
        web.ignoring().antMatchers("/index.html", "/swagger-ui.html","/static/**", "/login_p", "/manifest.json", "/pushwoosh-service-worker.js");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // 登陆设置
        http.formLogin()
            .loginProcessingUrl("/authentication")   // 认证处理路径
            .loginPage("/login_p")
            .permitAll()
            .successHandler((httpServletRequest, httpServletResponse, authentication) -> {
                httpServletResponse.setContentType("application/json;charset=utf-8");
                PrintWriter out = httpServletResponse.getWriter();
                UserDetails currentUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                ObjectMapper objectMapper = new ObjectMapper();

                String s = objectMapper.writeValueAsString(currentUser.getAuthorities());
                System.out.println("return value is :"+s);
                out.write(s);
                out.flush();
                out.close();
            }).failureHandler((httpServletRequest, httpServletResponse, e) -> {
            httpServletResponse.setContentType("application/json;charset=utf-8");
            PrintWriter out = httpServletResponse.getWriter();
            StringBuffer sb = new StringBuffer();
            sb.append("{\"status\":\"error\",\"msg\":\"");
            if (e instanceof UsernameNotFoundException || e instanceof BadCredentialsException) {
                sb.append("用户名或密码错误，登陆失败！");
            } else if (e instanceof DisabledException) {
                sb.append("账户无效，登陆失败，请联系管理员！");
            } else {
                sb.append("登陆失败，请重新尝试");
            }
            sb.append("\"}");
            out.write(sb.toString());
            out.flush();
            out.close();
        })
            .and().logout().permitAll().logoutUrl("/logout").logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler())
            .and().csrf().disable().cors()
            .and().rememberMe().rememberMeParameter("rememberMe")
            .and().exceptionHandling().authenticationEntryPoint(new Http401AuthenticationEntryPoint("ITEC_UNAUTHORIZED"));

        // 認可の設定
        http.authorizeRequests()
            .antMatchers("/", "/index", "/login_p", "/favicon.ico", "/api/v1/users/*/password", "/api/v1/users/token/**").permitAll() // indexは全ユーザーアクセス許可
            .anyRequest().authenticated();  // それ以外は全て認証無しの場合アクセス不許可
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //TODO インメモリDBと独自ユーザテーブルで処理が変わる部分
        auth.userDetailsService(getUserService).passwordEncoder(bCryptPasswordEncoder);
    }
}