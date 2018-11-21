package com.lzz.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class PasswordResets implements Serializable {
    private Integer userId;

    private String email;

    private String token;

    private Date created;

    private static final long serialVersionUID = 1L;


}