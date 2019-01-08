package org.zeus.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class SysLogSearchForm {

    @ApiModelProperty("日志类型")
    private String logType;

    @ApiModelProperty("操作人")
    private String operator;

    @ApiModelProperty("操作人角色")
    private String operatorRole;

    @ApiModelProperty("开始操作时间")
    private Date startTime;

    @ApiModelProperty("结束操作时间")
    private Date endTime;

}
