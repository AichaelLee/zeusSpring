package org.zeus.service;

import org.zeus.bean.Managers;
import org.zeus.bean.Role;
import org.zeus.dmsMapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
public class UserService {

    @Autowired
    UserMapper userMapper;




    protected Collection<GrantedAuthority> getAuthorities(Managers users) {

        if (users != null) {

            List<GrantedAuthority> authorities = new ArrayList<>();
            List<Role> roles = users.getRoles();
            for (Role role : roles) {
                authorities.add(new SimpleGrantedAuthority(role.getName()));
            }
            return authorities;
        }
        return AuthorityUtils.createAuthorityList();
    }



    public int updateHrRoles(Long hrId, Long[] rids) {
        int i = userMapper.deleteRoleByHrId(hrId);
        return userMapper.addRolesForHr(hrId, rids);
    }


    public List<Role> getRolesByHrId(Long id){
        return userMapper.getRolesByHrId(id);
    }

}
