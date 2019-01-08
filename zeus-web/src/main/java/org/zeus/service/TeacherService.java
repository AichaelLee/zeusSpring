package org.zeus.service;

import org.zeus.bean.Role;
import org.zeus.bean.TblTeacherBase;
import org.zeus.common.ServerResponse;
import org.zeus.common.UserUtils;
import org.zeus.dmsMapper.TeachersMapper;
import org.zeus.dto.UserInfoUpdateForm;
import org.zeus.dto.UserRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Created by aichaellee on 2018/11/30.
 */
@Service
public class TeacherService {

    @Autowired
    TeachersMapper teachersMapper;

//    @Cacheable("teacher_info")
    public TblTeacherBase loadTeachertByName(String username){
        return teachersMapper.loadUserByUsername(username);
    }

    public List<Role> getRolesByTeacherId(Long id){

        return teachersMapper.getRolesByTeacherId(id);
    }

    public List<TblTeacherBase> getAllUsers(){
        return teachersMapper.getAllUsers();
    }

    /**
     * 添加新用户
     * @param user
     * @return
     */
    public ServerResponse<Integer> addNewUser(UserRegister user) {

        if(!Optional.ofNullable(user).isPresent()){
            throw new RuntimeException("用户信息不能为空！");
        }

        teachersMapper.addNewUser(user);

        return ServerResponse.createBySuccess("用户创建成功");


    }

    /**
     * 修改用户信息
     * @param userInfo
     * @return
     */
    public ServerResponse updateUserInfo(UserInfoUpdateForm userInfo){
        userInfo.setId(UserUtils.getCurrentUser().getId());
        int result = teachersMapper.updateUserInfo(userInfo);
        if(result>0){
            return ServerResponse.createBySuccess("个人信息修改成功");
        }else{
            return ServerResponse.createBySuccess("个人信息修改失败！");
        }
    }

    public void updatePassword(TblTeacherBase user){
        teachersMapper.updatePassword(user);
    }
}
