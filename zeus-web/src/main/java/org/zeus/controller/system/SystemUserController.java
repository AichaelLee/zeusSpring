package org.zeus.controller.system;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.zeus.bean.User;
import org.zeus.bean.UserExample;
import org.zeus.common.ServerResponse;
import org.zeus.common.UserUtils;
import org.zeus.common.fw.LogType;
import org.zeus.common.fw.annotation.SystemLog;
import org.zeus.dmsMapper.UserMapper;
import org.zeus.dto.PassWordResetResource;
import org.zeus.dto.UserInfoUpdateForm;
import org.zeus.dto.UserRegister;
import org.zeus.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统基本设置
 * @author: lizhizhong
 * CreatedDate: 2018/11/26.
 */
@RestController
@Api(value="user基本信息controller",tags={"user基本信息controller"})
@RequestMapping("/system/basic")
@Slf4j
public class SystemUserController {
    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;
    @Autowired
    MenuRoleService menuRoleService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    /**切换用户选择的角色**/
    @Autowired
    RestAuthentication restAuthentication;

    @Autowired
    private UserAndRoleService userAndRoleService;

    @Autowired
    UserMapper userMapper;



    /**
     * 添加新用户
     * @param user
     * @return
     */
    @PostMapping("addUser")
    @ApiOperation(value = "添加新用户",notes = "添加新用户")
    public ServerResponse addUser(UserRegister user){

        String encodePass = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodePass);
        userAndRoleService.addNewUser(user);
        return ServerResponse.createBySuccess("用户添加成功!");

    }

    /**
     * 获取用户列表
     * @return
     */
    @ApiOperation(value = "得到所有用户",notes="得到系统中的用户列表")
    @GetMapping("users")
    @SystemLog(description="查询系统中的所有用户",type= LogType.OPERATION )
    public ServerResponse<List<User>> getAllUser(){
        UserExample example = new UserExample();
        List<User> lists = userMapper.selectByExample(example);
        lists.forEach(o-> o.setRoles(userAndRoleService.getRolesByUserId(o.getId())));

        return ServerResponse.createBySuccess(lists);
    }

    /**
     * 用户修改个人信息
     * @param userInfo
     * @return
     */
    @ApiOperation(value = "修改个人信息",notes="用户个人修改信息")
    @PutMapping("userInfo")
    @SystemLog(description="修改个人信息",type= LogType.UPDATE )
    public ServerResponse updateOwnUserInfo(UserInfoUpdateForm userInfo){
        if(userInfo.isEmpty()){
            return ServerResponse.createBySuccess("请填写需要修改的个人信息");
        }
        return userAndRoleService.updateUserInfo(userInfo);
    }

    @ApiOperation(value = "修改密码",notes="用户修改个人密码")
    @PutMapping("passwordReset")
    @SystemLog(description="修改个人密码",type= LogType.UPDATE )
    public ServerResponse passwordReset(@Validated(PassWordResetResource.PasswordChk.class) PassWordResetResource form, String oldPassword,
                                        BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            log.info("传递参数有误:{}", bindingResult.getFieldError().getDefaultMessage());
            return ServerResponse.createByError(bindingResult.getFieldError().getDefaultMessage());
        }

        User user = userMapper.selectByPrimaryKey(UserUtils.getCurrentUser().getId().intValue());
        if(bCryptPasswordEncoder.matches(oldPassword,user.getPassword())){
            // 更新密码
            user.setPassword(bCryptPasswordEncoder.encode(form.getPassword()));
            // update
            userMapper.updateByPrimaryKey(user);
            return ServerResponse.createBySuccess("密码更新成功");
        }else{
            return ServerResponse.createByError("密码更新失败！");
        }

    }






}
