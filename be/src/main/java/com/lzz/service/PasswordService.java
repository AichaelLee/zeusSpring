package com.lzz.service;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.entity.Users;

/**
 * Created by aichaellee on 2018/10/10.
 */
public interface PasswordService {
    ServerResponse<Integer> forgetPassword(Users users);
}
