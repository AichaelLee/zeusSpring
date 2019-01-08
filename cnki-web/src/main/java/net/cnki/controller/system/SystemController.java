package net.cnki.controller.system;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import net.cnki.bean.RespBean;
import net.cnki.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by lizhizhong on 2018/11/22.
 */
@RestController
@Api(value="用户管理controller",tags = {"用户管理相关接口"})
@RequestMapping("/system/user")
public class SystemController {
    @Autowired
    UserService userService;


    @ApiOperation(value = "更新用户角色",notes="更新用户角色")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "Long", name = "userId", value = "用户id"),
            @ApiImplicitParam(dataType = "Long[]", name = "rids", value = "角色id数组")})
    @PutMapping(value = "/roles")
    public RespBean updateUserRoles(Long userId, Long[] rids) {
        if (userService.updateHrRoles(userId, rids) == rids.length) {
            return RespBean.ok("角色更新成功!");
        }
        return RespBean.error("角色更新失败!");
    }



}
