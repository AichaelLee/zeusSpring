package net.cnki.common;

import net.cnki.bean.Managers;
import net.cnki.bean.TblTeacherBase;
import net.cnki.bean.UserBase;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 得到当前用户信息
 * @author: lizhizhong
 * CreatedDate: 2018/11/28.
 */
public class UserUtils {
    public static TblTeacherBase getCurrentUser() {

        Object o =  SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return (TblTeacherBase)o;


    }
}
