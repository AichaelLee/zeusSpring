package com.lzz.common.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Principal;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/1.
 */
@Component
public class LogTrackInterceptor implements HandlerInterceptor {

    private static final String USER_ID = "userId";
    private static final String SESSION_ID = "sessionId";
    private static final String ANONYMOUS = "未设定用户";
    private static final Logger LOGGER = LoggerFactory.getLogger(LogTrackInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {

        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        String remoteIp = request.getRemoteAddr();
        //LOGGER.info("client ip:{}, X-Forwarded-For:{}", remoteIp, xForwardedForHeader);

        Principal auth = request.getUserPrincipal();
        String userId = "";
        if (auth != null) {
            userId = auth.getName();
        } else {
            userId = ANONYMOUS;
        }
        MDC.put(USER_ID, userId);

        HttpSession session = request.getSession(false);
        if (session != null) {
            MDC.put(SESSION_ID, session.getId());
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //LOGGER.info("清除用户ID和SessionID");
        MDC.remove(USER_ID);
        MDC.remove(SESSION_ID);
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

}
