package org.zeus.common;
import org.springframework.security.core.context.SecurityContextHolder;
import org.zeus.bean.User;

/**
 * 得到当前用户信息
 * @author: lizhizhong
 * CreatedDate: 2018/11/28.
 */
public class UserUtils {
    public static User getCurrentUser() {

        return (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


    }
}
