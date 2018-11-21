package com.lzz.service.impl;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.entity.PasswordResets;
import com.lzz.entity.Users;
import com.lzz.service.PasswordResetSendMail;
import com.lzz.service.PasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by aichaellee on 2018/10/10.
 */
@Service
public class PasswordServiceImpl implements PasswordService {

    @Autowired
    PasswordResetSendMail passwordResetSendMail;

    @Override
    public ServerResponse<Integer> forgetPassword(Users user) {

        // send mail
        PasswordResets passReset = new PasswordResets();
        passReset.setEmail(user.getEmail());
        passReset.setUserId(user.getId());
        passwordResetSendMail.sendMail(passReset);
        return ServerResponse.createBySuccessMessage("密码重置邮件发送成功，请注意查收");
    }
}
