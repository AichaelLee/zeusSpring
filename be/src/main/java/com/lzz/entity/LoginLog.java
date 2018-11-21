package com.lzz.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class LoginLog implements Serializable {
    private Integer id;

    private Integer userId;

    private Integer type;

    private Integer deviceId;

    private String ipAddress;

    private String userAgent;

    private Date created;

    private static final long serialVersionUID = 1L;

}