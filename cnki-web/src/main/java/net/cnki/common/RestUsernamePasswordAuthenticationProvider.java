package net.cnki.common;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author: lizhizhong
 * CreatedDate: 2018/11/28.
 */
public class RestUsernamePasswordAuthenticationProvider extends DaoAuthenticationProvider {

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails,
            UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {

        super.additionalAuthenticationChecks(userDetails, authentication);

    }

    @Override
    protected Authentication createSuccessAuthentication(Object principal, Authentication authentication,
                                                         UserDetails user) {

        UsernamePasswordAuthenticationToken s = (UsernamePasswordAuthenticationToken) super.createSuccessAuthentication(
                principal, authentication, user);

        UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) authentication;
        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(
                principal, token.getCredentials(), s.getAuthorities());
        result.setDetails(token.getDetails());

        return result;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class
                .isAssignableFrom(authentication);
    }
}
