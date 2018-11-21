package com.lzz.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class LoginRegisterdDevices implements Serializable {
    private Integer id;

    private Integer userId;

    private String token;

    private Date lastLogin;

    private Date created;

    private static final long serialVersionUID = 1L;

}