package org.zeus.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/11/30.
 */
@Service
@Slf4j
public class SecurityMobileUserDetailService implements UserDetailsService{

    @Autowired
    UserDetailService userDetailService;





    @Override
    public UserDetails loadUserByUsername(String mobile) throws UsernameNotFoundException {

        System.out.println("mobile phone is :"+mobile);
        return userDetailService.loadUserByMobile(mobile);


    }

}
