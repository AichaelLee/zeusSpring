package org.zeus.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/31.
 */
@Data
public class UserRegister {


    @ApiModelProperty(value="登录名",required=true)
    private String username;

    @ApiModelProperty(value="密码",required=true)
    private String password;

    @ApiModelProperty(value="用户姓名",required=true)
    private String teacherName;

//    @ApiModelProperty(value="角色id",required=true)
//    private Integer roleId;
}
