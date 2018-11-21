package com.lzz.service;

import com.lzz.common.fw.DTO.ServerResponse;

/**
 * Created by aichaellee on 2018/10/10.
 */
public interface AccountService {
    ServerResponse<Integer> lockAccount(Integer id);

    ServerResponse<Integer> unlockAccount(Integer id);
}
