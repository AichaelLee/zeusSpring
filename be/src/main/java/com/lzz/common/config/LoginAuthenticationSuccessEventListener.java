package com.lzz.common.config;

import com.lzz.common.util.UserDetails;
import com.lzz.entity.TAccessLog;
import com.lzz.mapper.TAccessLogRepository;
import com.lzz.mapper.UserTodoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

@Component
public class LoginAuthenticationSuccessEventListener implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {

    // 更新最后登陆时间
    @Autowired
    UserTodoRepository userTodoRepository;

    //delete wrong password log
    @Autowired
    TAccessLogRepository tAccessLogService;
    private static final Logger logger = LoggerFactory.getLogger(LoginAuthenticationSuccessEventListener.class);

    @Override
    public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {

        if (logger.isDebugEnabled()) {
            logger.debug("[Event] InteractiveAuthenticationSuccessEvent invoke");
        }

        UserDetails details = (UserDetails) event.getAuthentication()
            .getPrincipal();

        TAccessLog tAccessLog = new TAccessLog();
        tAccessLog.setUserId(details.getAccount().getId());
        tAccessLog.setLoginStatus("1");
        tAccessLog.setCreateUserId(details.getAccount().getId());
        tAccessLog.setUpdateUserId(details.getAccount().getId());
        tAccessLog.setVersionNo(0);
        tAccessLogService.insertLog(tAccessLog);
        userTodoRepository.Login_updateLastLogintime(details.getAccount());
        tAccessLogService.deleteWrongRecords(details.getAccount().getId());
    }
}