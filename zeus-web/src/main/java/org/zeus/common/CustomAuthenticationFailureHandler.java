package org.zeus.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.zeus.bean.RespBean;
import org.zeus.common.fw.LogType;
import org.zeus.dmsMapper.SysLogMapper;
import org.zeus.entity.SysLog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * @author: lizhizhong
 * CreatedDate: 2019/1/14.
 */
@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Autowired
    SysLogMapper sysLogMapper;
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
