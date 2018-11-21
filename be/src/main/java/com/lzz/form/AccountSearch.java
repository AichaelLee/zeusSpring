package com.lzz.form;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;


@Data
public class AccountSearch implements Serializable{

    private Integer id;
    private String name;
    private String email;
    private String password;
    private Timestamp passwordLastModified;
    private Integer accontType;
    private Integer adminType;
    private String tokuisakiCd;
    private String shiiresakiCd;
    private Timestamp lastLogin;
    private Timestamp created;
    private String loginStatus;
    private Timestamp lastLoginstart;
    private Timestamp lastLoginend;
}
