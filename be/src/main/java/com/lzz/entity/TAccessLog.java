package com.lzz.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class TAccessLog implements Serializable {
    private Integer userId;

    private String loginStatus;

    private Date loginTimestamp;

    private Integer createUserId;

    private Date createDate;

    private Integer updateUserId;

    private Date updateDate;

    private Integer versionNo;

    private static final long serialVersionUID = 1L;


}