package net.cnki.service;

import lombok.extern.slf4j.Slf4j;
import net.cnki.bean.Managers;
import net.cnki.bean.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
@Slf4j
public class ManagerUserDetailService {

    @Autowired
    ManagerService managerService;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Managers managers = managerService.loadUserByUsername(username);

        List<Role> roles = managerService.getRolesById(managers.getId());

        managers.setRoles(roles);

        if (managers == null) {

            throw new UsernameNotFoundException("管理员用户名错误");
        }
        return managers;

    }

}
