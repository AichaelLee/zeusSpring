package com.lzz.service;

import com.lzz.common.constant.AuthorizationConst;
import com.lzz.entity.Users;
import com.lzz.entity.UsersExample;
import com.lzz.mapper.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.List;

@Component
public class GetUserService implements UserDetailsService{

    @Autowired
    private UsersMapper usersMapper;

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        UsersExample param = new UsersExample();
        param.createCriteria().andEmailEqualTo(s);

        List<Users> result = usersMapper.selectByExampleWithBLOBs(param);

        if(result != null && result.size() > 0)
        {
            return new com.lzz.common.util.UserDetails(result.get(0), getAuthorities(result.get(0)));
        }

        throw new UsernameNotFoundException("user not found");
    }

    private Collection<GrantedAuthority> getAuthorities(Users users) {

        if(users != null)
        {
            Integer type = users.getAccontType();
            type = type == 1 ? users.getAdminType() : type;

            String auth = AuthorizationConst.AUTHORIZATION_MAP.get(type);

            if(!StringUtils.isEmpty(auth))
            {
                return AuthorityUtils.createAuthorityList(AuthorizationConst.TWE_FACTOR_AUTH, auth);
            }
        }
        return AuthorityUtils.createAuthorityList();
    }
}
