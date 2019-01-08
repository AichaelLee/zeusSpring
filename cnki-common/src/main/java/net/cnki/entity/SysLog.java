package net.cnki.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysLog implements Serializable {
    private Integer logId;

    private String logType;

    private String logContent;

    private Date operationTime;

    private String operator;

    private String sysType;

    private String operatorRole;

    private String ipAddress;

    private static final long serialVersionUID = 1L;

}