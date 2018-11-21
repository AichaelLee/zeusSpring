package com.lzz.entity;

import java.io.Serializable;
import java.util.Date;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public Long getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(Long orderstatus) {
        this.orderstatus = orderstatus;
    }

    public Long getCustomernumber() {
        return customernumber;
    }

    public void setCustomernumber(Long customernumber) {
        this.customernumber = customernumber;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public Long getDeliverydestinationcode() {
        return deliverydestinationcode;
    }

    public void setDeliverydestinationcode(Long deliverydestinationcode) {
        this.deliverydestinationcode = deliverydestinationcode;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public String getDearcustomer() {
        return dearcustomer;
    }

    public void setDearcustomer(String dearcustomer) {
        this.dearcustomer = dearcustomer == null ? null : dearcustomer.trim();
    }

    public Long getCustomtower() {
        return customtower;
    }

    public void setCustomtower(Long customtower) {
        this.customtower = customtower;
    }

    public Long getOrderno() {
        return orderno;
    }

    public void setOrderno(Long orderno) {
        this.orderno = orderno;
    }

    public Double getTotalfee() {
        return totalfee;
    }

    public void setTotalfee(Double totalfee) {
        this.totalfee = totalfee;
    }
}