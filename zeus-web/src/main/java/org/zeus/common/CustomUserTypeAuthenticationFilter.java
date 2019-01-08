package org.zeus.common;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 添加自定义的登录时额外字段的验证过滤器
 * @author: lizhizhong
 * CreatedDate: 2018/11/30.
 */
public class CustomUserTypeAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    public static final String SPRING_SECURITY_FORM_DOMAIN_KEY = "userType";

    /**
     *
     * @param request
     * @param response
     * @return Authentication 对象
     * @throws AuthenticationException
     */
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
        throws AuthenticationException {

        if (!request.getMethod()
            .equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }

        UsernamePasswordAuthenticationToken authRequest = getAuthRequest(request);
        setDetails(request, authRequest);
        return this.getAuthenticationManager()
            .authenticate(authRequest);
    }

    private UsernamePasswordAuthenticationToken getAuthRequest(HttpServletRequest request) {
        String username = obtainUsername(request);
        String password = obtainPassword(request);
        String userType = obtainUserType(request);

        if (username == null) {
            username = "";
        }
        if (password == null) {
            password = "";
        }
        if (userType == null) {
            userType = "";
        }

        String usernameAndType = String.format("%s%s%s", username.trim(),
            String.valueOf(Character.LINE_SEPARATOR), userType);

        return new UsernamePasswordAuthenticationToken(usernameAndType, password);
    }

    /**
     * 得到用户类型userType 以在UserDetailServices中进行登录验证
     * @param request
     * @return 用户类型
     */
    private String obtainUserType(HttpServletRequest request) {
        return request.getParameter(SPRING_SECURITY_FORM_DOMAIN_KEY);
    }
}
