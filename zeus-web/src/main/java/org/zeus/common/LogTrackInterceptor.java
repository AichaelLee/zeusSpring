package org.zeus.common;

import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class LogTrackInterceptor implements HandlerInterceptor {

    private static final String USER_ID = "userId";

    private static final String SESSION_ID = "sessionId";

    private static final String ANONYMOUS = "匿名用户";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {

        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        String remoteIp = request.getRemoteAddr();

        if(log.isDebugEnabled()){
            log.debug("client ip:{}, X-Forwarded-For:{}", remoteIp, xForwardedForHeader);
        }

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

        if(log.isDebugEnabled()){
           log.debug("清除用户ID和SessionID");
        }

        MDC.remove(USER_ID);
        MDC.remove(SESSION_ID);
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

}
