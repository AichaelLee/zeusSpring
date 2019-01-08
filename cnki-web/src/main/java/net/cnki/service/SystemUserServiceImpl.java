package net.cnki.service;

import net.cnki.common.ServerResponse;
import net.cnki.dmsMapper.TeachersMapper;
import net.cnki.dto.UserRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/31.
 */
@Service("SystemUserService")
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    TeachersMapper teachersMapper;

    @Override
    public ServerResponse<Integer> addUser(UserRegister user) {

        if(!Optional.ofNullable(user).isPresent()){
            throw new RuntimeException("用户信息不能为空！");
        }

        teachersMapper.addNewUser(user);

        return ServerResponse.createBySuccess("用户创建成功");


    }
}
