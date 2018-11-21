package com.lzz.common.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by aichaellee on 2018/9/29.
 */
@Slf4j
//@Component
public class MyAuthenticationFailHandler extends SimpleUrlAuthenticationFailureHandler {


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {

//        log.info("登录失败");
//        //设置状态码
//        response.setStatus(500);
//        response.setContentType("application/json;charset=UTF-8");
//        //将 登录失败 信息打包成json格式返回
//        ObjectMapper objectMapper = new ObjectMapper();
//        String s = objectMapper.writeValueAsString("登陆失败");
//        response.getWriter().write(s);



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
    }


}
