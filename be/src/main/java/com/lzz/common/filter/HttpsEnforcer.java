package com.lzz.common.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * 在云平台可能存在url的https前缀不能显示
 * 这个类主要解决此类问题
 * */
public class HttpsEnforcer implements Filter {
    private FilterConfig filterConfig;


    private static Logger logger = LoggerFactory.getLogger(HttpsEnforcer.class);

    public static final String X_FORWARDED_PROTO = "x-forwarded-proto";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if(logger.isDebugEnabled()) {
            logger.debug("→" + request.getHeader(X_FORWARDED_PROTO));
            logger.debug("→" + request.getServerName() + ":" + request.getRequestURI());
        }

        if (request.getHeader(X_FORWARDED_PROTO) != null) {
            if (request.getHeader(X_FORWARDED_PROTO).indexOf("https") != 0) {
                response.sendRedirect("https://" + request.getServerName() + ":" + request.getRequestURI());
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // nothing
    }
}
