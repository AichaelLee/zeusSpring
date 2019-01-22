package org.zeus.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zeus.bean.Role;
import org.zeus.bean.User;
import org.zeus.bean.UserExample;
import org.zeus.dmsMapper.UserMapper;

import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
@Slf4j
public class UserDetailService {

    @Autowired
    UserAndRoleService teacherService;

    @Autowired
    UserMapper userMapper;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // load user by userName
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(username);
        List<User> users = userMapper.selectByExample(example);
        if (users == null) {
            throw new UsernameNotFoundException("用户名错误");
        }

        List<Role> roles = teacherService.getRolesByUserId(users.get(0).getId());
        users.get(0).setRoles(roles);
        log.info("教师账号验证开始{}",users.get(0).getName());

        return users.get(0);

    }
    public UserDetails loadUserByMobile(String m) throws UsernameNotFoundException {

        // load user by mobile
        UserExample example = new UserExample();
        example.createCriteria().andMobileEqualTo(Integer.valueOf(m));
        List<User> users = userMapper.selectByExample(example);
        if (users == null) {
            throw new UsernameNotFoundException("未绑定此手机号");
        }

        List<Role> roles = teacherService.getRolesByUserId(users.get(0).getId());
        users.get(0).setRoles(roles);
        log.info("手机登录验证{}",users.get(0).getMobile());

        return users.get(0);

    }


}
