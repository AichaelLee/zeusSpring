package com.lzz.common.util;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.lzz.entity.Users;


public class UserDetails extends User {

    private final Users account;

    public UserDetails(Users account, Collection<? extends GrantedAuthority> authorities) {
        super(account.getEmail(), account.getPassword(), authorities);
        this.account = account;
    }

    public Users getAccount() {
        return account;
    }

}
