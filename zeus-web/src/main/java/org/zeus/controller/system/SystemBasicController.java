package org.zeus.controller.system;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.zeus.bean.*;
import org.zeus.common.ServerResponse;
import org.zeus.common.UserUtils;
import org.zeus.common.fw.LogType;
import org.zeus.common.fw.annotation.SystemLog;
import org.zeus.dmsMapper.SysLogMapper;
import org.zeus.dmsMapper.TblPlanMapper;
import org.zeus.dto.MenuUpdateForm;
import org.zeus.dto.SysLogSearchForm;
import org.zeus.entity.SysLog;
import org.zeus.entity.SysLogExample;
import org.zeus.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.web.bind.annotation.*;
import org.zeus.service.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统基本设置
 * @author: lizhizhong
 * CreatedDate: 2018/11/26.
 */
@RestController
@Api(value="系统基本信息controller",tags={"角色与菜单等相关接口"})
@RequestMapping("/system/basic")
@Slf4j
public class SystemBasicController {
    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;
    @Autowired
    MenuRoleService menuRoleService;

    @Autowired
    UserService userService;

    @Autowired
    TblPlanMapper tblPlanMapper;

    /**切换用户选择的角色**/
    @Autowired
    RestAuthentication restAuthentication;

    @Autowired
    private SimpleAuthorityMapper simpleAuthorityMapper;

    @Autowired
    private SysLogMapper sysLogMapper;

    /**
     * 得到所有角色,注意不是查看某用户的所有角色
     * @return 当前系统存在的所有角色
     */
    @ApiOperation(value = "列出所有角色",notes="得到当前系统中存在的所有角色")
    @GetMapping("/roles")
    public List<Role> allRoles() {
        return roleService.roles();
    }


    @ApiOperation(value = "查看当前用户所拥有的角色",notes="getRolesById")
    @SystemLog(type = LogType.AUDITING,description = "得到用户拥有的所有角色")
    @GetMapping("/userRoles")
    public List<Role> getRolesById(){
        return roleService.getRolesByUserId(UserUtils.getCurrentUser().getId());
    }


    @PostMapping(value = "/chooseRole")
    @Deprecated // dms中目前不需要角色的二次筛选
    @SystemLog(type = LogType.AUDITING,description = "选择角色")
    public RespBean chooseRole(@AuthenticationPrincipal Object principal, String choosedRole) throws Exception{

        if(principal instanceof Managers){

            log.info("管理员用户之前的全部角色为{}",((Managers) principal).getAuthorities().toString());

            // 根据需求决定
            return RespBean.error("管理员不需要选择角色!");

        }else if(principal instanceof TblTeacherBase){
            log.info("教师角色为:{}",((TblTeacherBase) principal).getAuthorities().toString());

        }

        log.info("用户选择的角色为:{}",choosedRole);

        // 切换用户选择的角色
        restAuthentication.resetUserAuthorities(choosedRole);


        List<Role> newRoles = new ArrayList<>();
        // TODO if null
        roleService.getRolesByUserId(UserUtils.getCurrentUser().getId())
        .stream().forEach(o->{
            if(o.getName().equals(choosedRole)){
                newRoles.add(o);
            }
        });

        UserUtils.getCurrentUser().setRoles(newRoles);

        return  RespBean.ok("", UserUtils.getCurrentUser());
    }

    /**
     * 当用户点击右上角的切换按钮的时候
     * @param details
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/switchRole")
    public List<Role> switchRole(@AuthenticationPrincipal Managers details) throws Exception{

        log.info("此时用户权限为{}",details.getAuthorities().toString());

        // 查询数据库,得到用户初始的所有角色返回给前端

        List<Role> roles = userService.getRolesByHrId(details.getId());

        return roles;

    }

    /**
     * 获得该学校的所有学年
     * @return
     */
    @GetMapping(value="/getPlans")
//    @Cacheable("getPlans")
    public RespBean getPlans(){
        TblPlanExample example = new TblPlanExample();
        example.createCriteria().andPlanIdIsNotNull();
        List<TblPlan> plans = tblPlanMapper.selectByExample(example);
        log.info("学年总数为:{}",plans.size());

        return RespBean.ok("",plans);
    }

    /**
     * 用户选择完角色后,进入主页前重新获得权限,此时用户只有一个权限
     *
     * TODO 后续或许会加上一个Choose_Role 和 Choose_Role_OK 的这两个权限
     *
     * **/
    @Deprecated // 得到当前选择的角色,在dms中暂时还用不到
    @GetMapping(value="/getSwitchAuth")
    public RespBean getSwitchAuth(@AuthenticationPrincipal Object principal){
        RespBean respBean = null;
        if(principal instanceof Managers){
            respBean =RespBean.ok("选择角色成功!",  ((Managers) principal));;
        }
        return respBean;

    }

    /**
     * 删除角色
     * @param rid
     * @return
     */
    @ApiOperation(value = "删除指定角色",notes="删除指定角色")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "Long", name = "rid", value = "角色id")
          })
    @RequestMapping(value = "/role/{rid}", method = RequestMethod.DELETE)
    public RespBean deleteRole(@PathVariable Long rid) {
        if (roleService.deleteRoleById(rid) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    /**
     * 添加角色
     * @param role
     * @param roleZh
     * @return
     */
    @ApiOperation(value = "添加新的角色",notes="向系统中添加新的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "String", name = "role", value = "新角色英文名称"),
            @ApiImplicitParam(dataType = "String", name = "roleZh", value = "新角色的中文名称")})
    @RequestMapping(value = "/addRole", method = RequestMethod.POST)
    public RespBean addNewRole(String role, String roleZh) {
        if (roleService.addNewRole(role, roleZh) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }


    @ApiOperation(value = "得到菜单树",notes="得到菜单树")
//    @ApiImplicitParams({
//            @ApiImplicitParam(paramType = "form", dataType = "Long", name = "rid", value = "角色id")
//           })
    @GetMapping(value = "/menuTree/{rid}")
    public Map<String, Object> menuTree(@PathVariable Long rid) {
        Map<String, Object> map = new HashMap<>();
        List<Menu> menus = menuService.menuTree();
        map.put("menus", menus);
        List<Long> selMids = menuService.getMenusByRid(rid);
        map.put("mids", selMids);
        return map;
    }

    /**
     * 根據mid获得菜单详细信息
     * @param mid
     * @return
     */
    @ApiOperation(value = "根据mid获得相应的菜单数据",notes="查看菜单数据")
    @GetMapping("menu/{mid}")
    public ServerResponse<Menu> getMenuByMid(@PathVariable Long mid){
        return ServerResponse.createBySuccess(menuService.getMenuByMid(mid));
    }

    /**
     * 根据mid修改菜单信息
     * @param mid
     * @return
     */
    @ApiOperation(value = "修改菜单数据",notes="根据mid修改菜单数据")
    @PutMapping("menu/{mid}")
    public ServerResponse updateMenuByMid(@PathVariable Long mid, MenuUpdateForm menuForm){

        if(menuForm!=null){
            menuForm.setId(mid);
            int res = menuService.updateMenuByMid(menuForm);
            if(res>0){
                return ServerResponse.createBySuccess("菜单修改成功");
            }else {
                return ServerResponse.createByError("该菜单不存在");
            }
        }else {
            return ServerResponse.createByError("菜单数据不能为空！");
        }

    }

    /**
     * 更新菜单权限 TODO
     * @param rid
     * @param mids
     * @return
     */
    @ApiOperation(value = "更新菜单树",notes="更新某角色对应的菜单项")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "Long", name = "rid", value = "角色id"),
            @ApiImplicitParam(dataType = "Long[]", name = "mids", value = "菜单id数组")
    })
    @PutMapping(value = "/updateMenuRole")
    public RespBean updateMenuRole(Long rid, Long[] mids) {
        if (menuRoleService.updateMenuRole(rid, mids) == mids.length) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    /**
     * 查看当前系统中的所有操作日志
     * @return
     */
    @ApiOperation(value = "获取操作日志",notes="获取操作日志")
    @GetMapping(value = "/logs")
    public ServerResponse<List<SysLog>> getAllLog(SysLogSearchForm form) throws Exception{

        SysLogExample example = new SysLogExample();
        SysLogExample.Criteria criteria =example.createCriteria();
        // 日志类型
        if(StringUtils.isNotEmpty(form.getLogType())){
            criteria = criteria.andLogTypeEqualTo(form.getLogType());
        }
        // 操作人
        if(StringUtils.isNotEmpty(form.getOperator())){
            criteria =criteria.
                    andOperatorLike(form.getOperator());
        }
        // 开始结束时间
        if(form.getStartTime()!=null && form.getEndTime()!=null){

            criteria = criteria.andOperationTimeBetween(form.getStartTime(),form.getEndTime());
        }

        List<SysLog> logs = sysLogMapper.selectByExample(example);

        return ServerResponse.createBySuccess("获取操作日志成功",logs);
    }



}
