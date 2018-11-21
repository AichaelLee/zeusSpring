package com.lzz.entity;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {
    private Long id;

    private String customername;

    private String suppliername;

    private Long customerorderno;

    private String addressee;

    private String dearcustomer;

    private Date orderdate;

    private Date deliverydate;

    private Long status;

    private String customerremarks;

    private Long myordersheet;

    private Long purchasehistory;

    private Long productcode;

    private String itemname;

    private Long quantity;

    private Long numberoforders;

    private Long totalnumber;

    private String remarks;

    private Date expectedarrivaldatel;

    private String deliverynoteattention;

    private Date lastorderdate;

    private Long lastordernumber;

    private Date shipdate;

    private Date arrivaldate;

    private Date productdeliverytime;

    private Long custnumber;

    private Double totalfee;

    private Double unitprice;

    private Double amountofmoney;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public Long getCustomerorderno() {
        return customerorderno;
    }

    public void setCustomerorderno(Long customerorderno) {
        this.customerorderno = customerorderno;
    }

    public String getAddressee() {
        return addressee;
    }

    public void setAddressee(String addressee) {
        this.addressee = addressee == null ? null : addressee.trim();
    }

    public String getDearcustomer() {
        return dearcustomer;
    }

    public void setDearcustomer(String dearcustomer) {
        this.dearcustomer = dearcustomer == null ? null : dearcustomer.trim();
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getCustomerremarks() {
        return customerremarks;
    }

    public void setCustomerremarks(String customerremarks) {
        this.customerremarks = customerremarks == null ? null : customerremarks.trim();
    }

    public Long getMyordersheet() {
        return myordersheet;
    }

    public void setMyordersheet(Long myordersheet) {
        this.myordersheet = myordersheet;
    }

    public Long getPurchasehistory() {
        return purchasehistory;
    }

    public void setPurchasehistory(Long purchasehistory) {
        this.purchasehistory = purchasehistory;
    }

    public Long getProductcode() {
        return productcode;
    }

    public void setProductcode(Long productcode) {
        this.productcode = productcode;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname == null ? null : itemname.trim();
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getNumberoforders() {
        return numberoforders;
    }

    public void setNumberoforders(Long numberoforders) {
        this.numberoforders = numberoforders;
    }

    public Long getTotalnumber() {
        return totalnumber;
    }

    public void setTotalnumber(Long totalnumber) {
        this.totalnumber = totalnumber;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getExpectedarrivaldatel() {
        return expectedarrivaldatel;
    }

    public void setExpectedarrivaldatel(Date expectedarrivaldatel) {
        this.expectedarrivaldatel = expectedarrivaldatel;
    }

    public String getDeliverynoteattention() {
        return deliverynoteattention;
    }

    public void setDeliverynoteattention(String deliverynoteattention) {
        this.deliverynoteattention = deliverynoteattention == null ? null : deliverynoteattention.trim();
    }

    public Date getLastorderdate() {
        return lastorderdate;
    }

    public void setLastorderdate(Date lastorderdate) {
        this.lastorderdate = lastorderdate;
    }

    public Long getLastordernumber() {
        return lastordernumber;
    }

    public void setLastordernumber(Long lastordernumber) {
        this.lastordernumber = lastordernumber;
    }

    public Date getShipdate() {
        return shipdate;
    }

    public void setShipdate(Date shipdate) {
        this.shipdate = shipdate;
    }

    public Date getArrivaldate() {
        return arrivaldate;
    }

    public void setArrivaldate(Date arrivaldate) {
        this.arrivaldate = arrivaldate;
    }

    public Date getProductdeliverytime() {
        return productdeliverytime;
    }

    public void setProductdeliverytime(Date productdeliverytime) {
        this.productdeliverytime = productdeliverytime;
    }

    public Long getCustnumber() {
        return custnumber;
    }

    public void setCustnumber(Long custnumber) {
        this.custnumber = custnumber;
    }

    public Double getTotalfee() {
        return totalfee;
    }

    public void setTotalfee(Double totalfee) {
        this.totalfee = totalfee;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public Double getAmountofmoney() {
        return amountofmoney;
    }

    public void setAmountofmoney(Double amountofmoney) {
        this.amountofmoney = amountofmoney;
    }
}