package com.lzz.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class Order implements Serializable {
    private Long id;

    private Date orderdate;

    private Date times;

    private Date deliverydate;

    private Long orderstatus;

    private Long customernumber;

    private String customername;

    private Long deliverydestinationcode;

    private String suppliername;

    private String dearcustomer;

    private Long customtower;

    private Long orderno;

    private Double totalfee;

    private static final long serialVersionUID = 1L;

}