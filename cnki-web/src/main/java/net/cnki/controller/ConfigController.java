package net.cnki.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net.cnki.bean.Menu;
import net.cnki.common.UserUtils;
import net.cnki.common.fw.LogType;
import net.cnki.common.fw.annotation.SystemLog;
import net.cnki.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 这是一个只要登录就能访问的Controller
 * 主要用来获取一些配置信息
 * @author: lizhizhong
 * CreatedDate: 2018/11/28.
 */

@RestController
@Api(value="配置controller",tags = {"获取当前菜单项接口"})
@RequestMapping("/config")
@Slf4j
public class ConfigController {
    @Autowired
    MenuService menuService;

    /**
     * 获取当前用户可访问的菜单选项
     * @return 菜单
     */
    @GetMapping("/sysmenu")
    @ApiOperation(value="得到菜单项",notes = "根据当前用户得到该用户所拥有的菜单项")
    public List<Menu> sysmenu() {
        return menuService.getMenusByUserId();
    }

    /**
     * 根据用户所选定的角色重新获得该角色所拥有的菜单权限
     * @return 菜单项
     */
    @GetMapping("/regetMenu")
    @ApiOperation(value="重新获得被选定角色的菜单项",notes = "重新获得被选定角色的菜单项")
    @SystemLog(type = LogType.AUDITING,description = "获取系统菜单")
    public List<Menu> getsyMenu(){

        Long rid = UserUtils.getCurrentUser().getRoles().get(0).getId();
        String rzh = UserUtils.getCurrentUser().getRoles().get(0).getName();
        log.info("选择用户角色为{},id为:{},该角色拥有的菜单权限为",rzh,rid);

        return menuService.getMemusInfoByRid(rid);

    }


}
