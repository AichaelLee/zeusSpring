package net.cnki.service;

import net.cnki.bean.Managers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
public class RestAuthentication {

    @Autowired
    private SimpleAuthorityMapper simpleAuthorityMapper;

    public void resetUserAuthorities(String  choosedRole){


        Authentication oldAuth = SecurityContextHolder.getContext().getAuthentication();
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(choosedRole));
        Authentication newAuth = new UsernamePasswordAuthenticationToken(
                oldAuth.getPrincipal(),oldAuth.getCredentials(),
                authorities);
        SecurityContextHolder.getContext().setAuthentication(newAuth);



//        Authentication oldAuth = SecurityContextHolder.getContext().getAuthentication();
//
//        Authentication newAuth = new UsernamePasswordAuthenticationToken(
//                oldAuth.getPrincipal(),oldAuth.getCredentials(),
//                simpleAuthorityMapper.mapAuthorities(getAuthorities(hr)));
//        SecurityContextHolder.createEmptyContext();
//        SecurityContextHolder.getContext().setAuthentication(newAuth);
    }


    private Collection<GrantedAuthority> getAuthorities(Managers users) {

        if (users != null) {

                return AuthorityUtils.createAuthorityList("ROLE_manager");
        }
        return AuthorityUtils.createAuthorityList();
    }
}
