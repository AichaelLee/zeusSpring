package com.lzz.common.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lzz.common.util.UserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException;
import org.springframework.security.oauth2.provider.*;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aichaellee on 2018/9/17.
 */
//@Component
public class MyAuthenticationSucessHandler implements AuthenticationSuccessHandler {

    @Autowired
    ClientDetailsService clientDetailsService;

    @Autowired
    AuthorizationServerTokenServices authorizationServerTokenServices;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse response, Authentication authentication) throws IOException, ServletException{
        String header = httpServletRequest.getHeader("Authorization");
        if(header != null && header.startsWith("Basic ")) {
            try {
                String[] failed = extractAndDecodeHeader(header, httpServletRequest);

                assert failed.length == 2;

                String clientId = failed[0];
                String clientSecret = failed[1];
                ClientDetails clientDetails = clientDetailsService.loadClientByClientId(clientId);

                if(clientDetails == null){
                    throw new UnapprovedClientAuthenticationException("clientId 对应的配置信息不存在"+clientId);

                }else if(!org.apache.commons.lang3.StringUtils.equals(clientDetails.getClientSecret(),clientSecret)){
                    throw new UnapprovedClientAuthenticationException("clientId secret 不匹配"+clientId);

                }

                TokenRequest tokenRequest = new TokenRequest(new HashMap<>(),clientId,clientDetails.getScope(),"custom");

                OAuth2Request oAuth2Request = tokenRequest.createOAuth2Request(clientDetails);

                OAuth2Authentication auth2Authentication = new OAuth2Authentication(oAuth2Request,authentication);

                OAuth2AccessToken auth2AccessToken =
                    authorizationServerTokenServices.createAccessToken(auth2Authentication);

                ObjectMapper objectMapper = new ObjectMapper();
                response.setContentType("application/json;charset=UTF-8");
                UserDetails currentUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                Map<String,Object> res = new HashMap<>();
                res.put("data",auth2AccessToken);
                res.put("role",currentUser.getAuthorities());
                response.getWriter().write(objectMapper.writeValueAsString(res));



            } catch (AuthenticationException var10) {
                SecurityContextHolder.clearContext();

                return;
            }
        } else {
            throw new RuntimeException("请求头中没有authorization");
        }


    }

    private String[] extractAndDecodeHeader(String header, HttpServletRequest request) throws IOException {
        byte[] base64Token = header.substring(6).getBytes("UTF-8");

        byte[] decoded;
        try {
            decoded = Base64.decode(base64Token);
        } catch (IllegalArgumentException var7) {
            throw new BadCredentialsException("Failed to decode basic authentication token");
        }

        String token = new String(decoded, "UTF-8");
        int delim = token.indexOf(":");
        if (delim == -1) {
            throw new BadCredentialsException("Invalid basic authentication token");
        } else {
            return new String[]{token.substring(0, delim), token.substring(delim + 1)};
        }
    }
}
