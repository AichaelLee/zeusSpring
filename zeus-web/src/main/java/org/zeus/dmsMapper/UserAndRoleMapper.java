package org.zeus.dmsMapper;

import org.zeus.bean.Role;
import org.zeus.dto.UserInfoUpdateForm;
import org.zeus.dto.UserRegister;

import java.util.List;

/**
 * Created by aichaellee on 2018/12/31.
 */
public interface UserAndRoleMapper {


    /**
     * 根据用户名得到用户的角色
     * @param TID
     * @return
     */
    List<Role> getRolesByUserId(Long TID);



    /**
     * 添加新用户
     * @param tblTeacherBase
     * @return
     */
    int addNewUser(UserRegister tblTeacherBase);

    /**
     * 新增用户时添加对应的角色
     * @param userRegister
     * @return
     */
    int addRoleOfUser(UserRegister userRegister);

    int updateUserInfo(UserInfoUpdateForm userInfoUpdateForm);



}
