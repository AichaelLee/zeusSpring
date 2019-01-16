package org.zeus.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.zeus.bean.Managers;
import org.zeus.bean.RespBean;
import org.zeus.bean.TblTeacherBase;
import org.zeus.common.CustomUserTypeAuthenticationFilter;
import org.zeus.common.SmsCodeAuthenticationSecurityConfig;
import org.zeus.common.fw.LogType;
import org.zeus.common.util.IpInfoUtil;
import org.zeus.common.validator.ValidateCodeFilter;
import org.zeus.common.validator.ValidateCodeSecurityConfig;
import org.zeus.dmsMapper.SysLogMapper;
import org.zeus.entity.SysLog;
import org.zeus.service.SecurityUserDetailService;

import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.stream.Collectors;

/**
 * spring security 配置类
 * @author: lizhizhong
 * CreatedDate: 2018/11/26.
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    SecurityUserDetailService securityUserDetailService;

    @Autowired
    CustomMetadataSource metadataSource;

    @Autowired
    UrlAccessDecisionManager urlAccessDecisionManager;

    @Autowired
    AuthenticationAccessDeniedHandler deniedHandler;

    @Autowired
    IpInfoUtil ipInfoUtil;

    /**
     * 校验码相关过滤器配置
     */
    @Autowired
    private ValidateCodeSecurityConfig validateCodeSecurityConfig;
    @Autowired
    private ValidateCodeFilter validateCodeFilter;

    @Autowired
    private SmsCodeAuthenticationSecurityConfig smsCodeAuthenticationSecurityConfig;

//    @Autowired
//    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    SimpleAuthorityMapper simpleAuthorityMapper;

    @Autowired
    SysLogMapper sysLogMapper;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

   // @Autowired
    //HrService hrService;
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(securityUserDetailService)
                .passwordEncoder(new BCryptPasswordEncoder());
    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/index.html", "/static/**", "/login_p","/code/**");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // druid 或 swagger 的iframe加载
        http.headers().frameOptions().sameOrigin();
        // 添加图片或手机验证码过滤器
        //http.addFilterBefore(validateCodeFilter, AbstractPreAuthenticatedProcessingFilter.class)
        //校验码相关配置
       // http.addFilterBefore(validateCodeFilter, AbstractPreAuthenticatedProcessingFilter.class);
        http.addFilterBefore(authenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
        .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
            @Override
            public <O extends FilterSecurityInterceptor> O postProcess(O o) {
                o.setSecurityMetadataSource(metadataSource);
                o.setAccessDecisionManager(urlAccessDecisionManager);
                return o;
            }
        })
        .and()
                // loginPage("/login_p"). todo
        .formLogin().loginProcessingUrl("/login")

//        .usernameParameter("username").passwordParameter("password")
        .failureHandler(new CustomAuthenticationFailureHandler())
        .successHandler(new CustomAuthenticationSuccessHandler())
        .permitAll()
        .and()
            .apply(smsCodeAuthenticationSecurityConfig).and()
        .logout().permitAll()
        .and().csrf().disable()
        .exceptionHandling().accessDeniedHandler(deniedHandler);
    }



    /**
     * 自定义用户类型验证过滤器,增加userType字段
     * @return
     * @throws Exception
     */
    public CustomUserTypeAuthenticationFilter authenticationFilter() throws Exception {
        CustomUserTypeAuthenticationFilter filter = new CustomUserTypeAuthenticationFilter();
        filter.setAuthenticationManager(authenticationManagerBean());
        filter.setAuthenticationFailureHandler(new CustomAuthenticationFailureHandler());
        filter.setAuthenticationSuccessHandler(new CustomAuthenticationSuccessHandler());
        return filter;
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
            if(principal instanceof Managers){
                respBean =RespBean.ok("登录成功!",  ((Managers) principal));
            }else if(principal instanceof TblTeacherBase){
                respBean =RespBean.ok("登录成功!",  ((TblTeacherBase) principal));
            }
            // 登录日志记录
            // 数据库中插入操作记录
            SysLog sysLog = new SysLog();
            sysLog.setOperatorRole(((TblTeacherBase) principal).getRoles()
                    .stream().map(
                            o->o.getNameZh()).
                            collect(Collectors.joining(",")));
            sysLog.setLogType(LogType.LOGIN.getDesc());
            sysLog.setOperator(((TblTeacherBase) principal).getTeacherName());
            sysLog.setLogContent(String.format("%s 用户登录成功",((TblTeacherBase) principal).getTeacherName()));
            sysLog.setOperationTime(new Date());
            sysLog.setIpAddress(ipInfoUtil.getIpAddr(req));
            sysLogMapper.insert(sysLog);
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
            RespBean respBean = null;
            String reson = null;
            if (e instanceof BadCredentialsException ||
                    e instanceof UsernameNotFoundException) {
                reson="账户名或者密码输入错误!";
                respBean = RespBean.error(reson);
            } else if (e instanceof LockedException) {
                reson="账户被锁定，请联系管理员!";
                respBean = RespBean.error("账户被锁定，请联系管理员!");
            } else if (e instanceof CredentialsExpiredException) {
                reson="密码过期，请联系管理员!";
                respBean = RespBean.error("密码过期，请联系管理员!");
            } else if (e instanceof AccountExpiredException) {
                reson="账户过期，请联系管理员!";
                respBean = RespBean.error("账户过期，请联系管理员!");
            } else if (e instanceof DisabledException) {
                reson="账户被禁用，请联系管理员!";
                respBean = RespBean.error("账户被禁用，请联系管理员!");
            } else {
                reson="其他原因!";
                respBean = RespBean.error("其他原因!");
            }
            // 数据库中插入操作记录
            SysLog sysLog = new SysLog();
            sysLog.setOperatorRole("未知");
            sysLog.setLogType(LogType.LOGIN.getDesc());
            sysLog.setOperator((String)req.getSession().getAttribute("SPRING_SECURITY_LAST_USERNAME"));
            sysLog.setLogContent(String.format("用户登录失败，失败原因%s",reson));
            sysLog.setOperationTime(new Date());
            sysLogMapper.insert(sysLog);
            resp.setStatus(401);
            ObjectMapper om = new ObjectMapper();
            PrintWriter out = resp.getWriter();
            out.write(om.writeValueAsString(respBean));
            out.flush();
            out.close();
        }

    }
}