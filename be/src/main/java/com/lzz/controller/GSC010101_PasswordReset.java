package com.lzz.controller;

import com.lzz.common.util.MessageUtil;
import com.lzz.common.util.RabbitMqSender;
import com.lzz.common.util.ResultBean;
import com.lzz.entity.PasswordResets;
import com.lzz.entity.TAccessLog;
import com.lzz.entity.Users;
import com.lzz.form.GSC010101_PasswordResetResource;
import com.lzz.mapper.PasswordResetsRepository;
import com.lzz.mapper.TAccessLogRepository;
import com.lzz.mapper.UserTodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping(value = "api/v1/users")
public class GSC010101_PasswordReset {

    private static String MAIL_THIS_URL = System.getenv("MAIL_THIS_URL_FORGET");

    private static String MAIL_THIS_MAIL = "passwordReset@aichaellee.com";

    @Autowired
    UserTodoRepository userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    PasswordResetsRepository passwordResetsService;

    @Autowired
    TAccessLogRepository tAccessLogService;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    RabbitMqSender rabbitMq;

    @PutMapping(value = "{signId}/password")
    @ResponseStatus(HttpStatus.OK)
    public Map<String, Object> sendMail(@Validated PasswordResets form,
                                        BindingResult bindingResult) {

        Map<String, Object> retrunResult = new HashMap<>();
        ResultBean resultBean = new ResultBean();
        // メールアドレスチェックエラーの場合
        if (bindingResult.hasErrors()) {
            // なにもしなくて返す
            retrunResult.put("status", 201);
            retrunResult.put("msg", "error");
            return retrunResult;
        }

        // メール関連ユーザーの存在チェック なしの場合エラーメッセージ
        Users result = userService.findOneByEmail(form.getEmail());

        Optional<Integer> id = Optional.ofNullable(result).map((value) -> value.getId());

        if (!id.isPresent()) {
//            resultBean.getMassegeMap().put("msg", "ご入力いただいたメールアドレスが正しい内容ではありません。");
            retrunResult.put("status", 201);
            retrunResult.put("msg", messageUtil.getMessage("PWRESET_ADDRESS_TEXT"));
            return retrunResult;
        }

        PasswordResets passwordResets = new PasswordResets();
        passwordResets.setUserId(id.get());

        // 删除以前留下的无效token
        passwordResetsService.deleteToken(passwordResets);

        // 生成新的token
        passwordResets.setEmail(form.getEmail());
        passwordResets.setToken(UUID.randomUUID().toString());
        passwordResetsService.insertToken(passwordResets);


        String username = userService.findOneByEmail(form.getEmail()).getName();

        //get the deadline
        long currentTime = System.currentTimeMillis();
        currentTime += 24 * 60 * 60 * 1000;
        Date date = new Date(currentTime);
        SimpleDateFormat dateFormat = new SimpleDateFormat(

            "yyyy-MM-dd HH:mm:ss");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Tokyo"));
        // メール送信
        Map<String, Object> mails = new HashMap<>();
        mails.put("from", messageUtil.getMessage("PWRESET_MAIL_FROM"));
        mails.put("to", form.getEmail());
        mails.put("subject", messageUtil.getMessage("PWFORGET_MAIL_SUBJECT"));
        mails.put("text", messageUtil.getMessage("PWFORGET_MAIL_TEXT", username, dateFormat.format(date), MAIL_THIS_URL + passwordResets.getToken(), MAIL_THIS_MAIL));
        rabbitMq.sendMailOnBatch(mails);

//        resultBean.getModelBeanMap().put("success", true);
        retrunResult.put("status", 200);
        retrunResult.put("msg", "邮件发送成功！");
        return retrunResult;
    }

    @GetMapping(value = "token/{token}")
    @ResponseStatus(HttpStatus.OK)
    public ResultBean tokenValid(@PathVariable String token) {
        ResultBean resultBean = new ResultBean();

        Map<String, Object> params = new HashMap<>();
        params.put("token", token);
        PasswordResets pr = new PasswordResets();
        pr.setToken(token);
        PasswordResets result = passwordResetsService.findOneByToken(pr);

        if (Optional.ofNullable(result).isPresent()) {
            resultBean.getModelBeanMap().put("token", token);
            resultBean.getModelBeanMap().put("tokenValid", true);
        } else {
            resultBean.getModelBeanMap().put("tokenInvalid", true);
        }
        return resultBean;
    }

    @PutMapping(value = "token/{token}/password")
    @ResponseStatus(HttpStatus.OK)
    public ResultBean passwordReset(@Validated(GSC010101_PasswordResetResource.PasswordChk.class) @ModelAttribute("PasswordResource") GSC010101_PasswordResetResource form,
                                    BindingResult bindingResult,
                                    @PathVariable String token,
                                    Model model) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        ResultBean resultBean = new ResultBean();
        // チェック
        if (bindingResult.hasErrors()) {
            resultBean.getModelBeanMap().put("tokenValid", true);
            resultBean.getMassegeMap().put("msg", bindingResult.getAllErrors().get(0).getDefaultMessage());
            return resultBean;
        }

        Map<String, Object> params = new HashMap<>();
        params.put("token", token);

        PasswordResets pr = new PasswordResets();
        pr.setToken(token);
        PasswordResets result = passwordResetsService.findOneByToken(pr);

        Optional<Integer> userID = Optional.ofNullable(result).map((value) -> value.getUserId());
        if (userID.isPresent()) {
            Users user = new Users();

            user.setId(userID.get());
            user.setPassword(passwordEncoder.encode(form.getPassword()));

            // 修改密码
            userService.updateUnlessNull(user);

            PasswordResets passwordResets = new PasswordResets();
            passwordResets.setUserId(userID.get());

            // 使い済トークン削除
            passwordResetsService.deleteToken(passwordResets);

            // set access_log login_status "5"
            TAccessLog tAccessLog = new TAccessLog();
            tAccessLog.setUserId(userID.get());
            tAccessLog.setCreateUserId(userID.get());
            tAccessLog.setUpdateUserId(userID.get());
            tAccessLog.setLoginStatus("5");
            tAccessLog.setVersionNo(0);
            tAccessLogService.insertLog(tAccessLog);
            resultBean.getModelBeanMap().put("pwResetOK", true);
        } else {
            // 当前token有效值
            resultBean.getModelBeanMap().put("tokenInvalid", true);
        }

        return resultBean;
    }
}
