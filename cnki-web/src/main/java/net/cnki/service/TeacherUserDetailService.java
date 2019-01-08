package net.cnki.service;

import lombok.extern.slf4j.Slf4j;
import net.cnki.bean.Role;
import net.cnki.bean.TblTeacherBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
@Slf4j
public class TeacherUserDetailService {

    @Autowired
    TeacherService teacherService;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TblTeacherBase teacherBase = teacherService.loadTeachertByName(username);
        List<Role> roles = teacherService.getRolesByTeacherId(teacherBase.getId());
        teacherBase.setRoles(roles);
        log.info("教师账号验证开始{}",teacherBase.getTeacherName());
        if (teacherBase == null) {

            throw new UsernameNotFoundException("用户名错误");
        }
        return teacherBase;

    }


}
