package com.lzz.service.impl;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.entity.TAccessLog;
import com.lzz.mapper.TAccessLogRepository;
import com.lzz.mapper.UserTodoRepository;
import com.lzz.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by aichaellee on 2018/10/10.
 */
@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    UserTodoRepository userTodoRepository;

    @Autowired
    TAccessLogRepository tAccessLogRepository;
    @Override
    public ServerResponse<Integer> lockAccount(Integer id) {

        Map<String, Object> result = new HashMap<>();
        userTodoRepository.updateAccountStatus(id, "10");

        // set access_log login_status "10"
        // 把该用户的log状态设为10，表示账户已经处于锁定状态
        TAccessLog tAccessLog = new TAccessLog();
        tAccessLog.setUserId(id);
        tAccessLog.setCreateUserId(id);
        tAccessLog.setUpdateUserId(id);
        tAccessLog.setLoginStatus("10");
        tAccessLog.setVersionNo(0);
        tAccessLogRepository.insertLog(tAccessLog);

        return ServerResponse.createBySuccessMessage("账户锁住成功！");
    }

    @Override
    public ServerResponse<Integer> unlockAccount(Integer id) {

        userTodoRepository.updateUnlockAccount(id);
        // set access_log login_status "10"
        TAccessLog tAccessLog = new TAccessLog();
        tAccessLog.setUserId(id);
        tAccessLog.setCreateUserId(id);
        tAccessLog.setUpdateUserId(id);
        tAccessLog.setLoginStatus("11");
        tAccessLog.setVersionNo(0);
        // 插入log
        tAccessLogRepository.insertLog(tAccessLog);
        tAccessLogRepository.deleteWrongRecords(id);

        return ServerResponse.createBySuccessMessage("账户解锁成功！");
    }
}
