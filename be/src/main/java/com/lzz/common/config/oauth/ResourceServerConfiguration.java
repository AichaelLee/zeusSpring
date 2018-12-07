package com.lzz.common.config.oauth;

import com.lzz.common.config.MyAuthenticationFailHandler;
import com.lzz.common.config.MyAuthenticationSucessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;

/**
 * Created by aichaellee on 2018/9/17.
 */
//@EnableGlobalMethodSecurity(prePostEnabled = true)
//@EnableResourceServer
//@Configuration
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {

    @Autowired
    private MyAuthenticationSucessHandler sucessHandler;

    @Autowired
    private MyAuthenticationFailHandler failHandler;

    @Override
    public void configure(HttpSecurity http) throws Exception {
//
//        http.formLogin().successHandler(authenticationSucessHandler);
//
//        http.antMatcher("/oauth2/api/**").authorizeRequests()
//            .antMatchers(HttpMethod.GET, "/read/**").access("#oauth2.hasScope('read')")
//            .antMatchers(HttpMethod.POST, "/write/**").access("#oauth2.hasScope('write')")
//            .antMatchers(HttpMethod.PUT, "/write/**").access("#oauth2.hasScope('write')")
//            .antMatchers(HttpMethod.DELETE, "/write/**").access("#oauth2.hasScope('write')");

        // 登陆设置
        http.formLogin()
            // 认证处理路径
            .loginProcessingUrl("/authentication")
            .loginPage("/login_p")
            .permitAll()
            .successHandler(sucessHandler).failureHandler(failHandler)
            .and().logout().permitAll().logoutUrl("/logout").logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler())
            .and().csrf().disable().cors()
            .and().rememberMe().rememberMeParameter("rememberMe")
            .and().exceptionHandling().authenticationEntryPoint(new HttpStatusEntryPoint(HttpStatus.UNAUTHORIZED));

        // 認可の設定
        http.authorizeRequests()
            .antMatchers("/", "/oauth/**","/index", "/login_p", "/favicon.ico", "/api/v1/users/*/password", "/api/v1/users/token/**")
            .permitAll() // indexは全ユーザーアクセス許可
            .anyRequest().authenticated();
        // それ以外は全て認証無しの場合アクセス不許可
//        http
//            .authorizeRequests()
//            .antMatchers("/login_p")
//            .authenticated()
//            .antMatchers("/oauth/token").permitAll()
//            .anyRequest()
//            .permitAll()
//            .and()
//            //关闭跨站请求防护
//            .csrf().disable();


    }


}

