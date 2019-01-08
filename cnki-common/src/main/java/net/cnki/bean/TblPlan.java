package net.cnki.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class TblPlan implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer planId;

    private Integer schoolNum;

    private String schoolYear;

    private String defaultYear;

    private String opentimenode;

    private String allowset;

    private Date createtime;

    private Date begintime;

    private Date endtime;

    private Date updateTime;




}