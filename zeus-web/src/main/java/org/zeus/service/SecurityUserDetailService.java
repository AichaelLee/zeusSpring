package org.zeus.service;

import lombok.extern.slf4j.Slf4j;
import org.zeus.common.UserTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/11/30.
 */
@Service
@Slf4j
public class SecurityUserDetailService implements UserDetailsService{

    @Autowired
    UserDetailService userDetailService;



    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {


        String[] usernameAndUserType = StringUtils.split(s, String.valueOf(Character.LINE_SEPARATOR));
        if (usernameAndUserType == null || usernameAndUserType.length != 2) {
            throw new UsernameNotFoundException("Username and UserType must be provided");
        }
        String username = usernameAndUserType[0];
       // String userType = usernameAndUserType[1];
        String userType = "2";

        log.info("登录用户类型为:{},用户名为:{}",UserTypeEnum.getUserTypeZh(userType),username);

        return userDetailService.loadUserByUsername(username);

    }

}
