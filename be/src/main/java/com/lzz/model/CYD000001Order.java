package com.lzz.model;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Data
public class CYD000001Order {

	public Long id;
	private String customername;
	private String suppliername;
	private Long custnumber;
	private Long customerorderno;
	private String addressee;
	private String dearcustomer;

	private Date orderdate;
	private Date deliverydate;
	private BigDecimal totalfee;

	private Long status;
	private String customerremarks;
	private Long myordersheet;
	private String purchasehistory;
	private Long productcode;
	private String itemname;
	private Long quantity;
	private String orderunit;
	private Long numberoforders;
	private Long totalnumber;
	private BigDecimal unitprice;
	private BigDecimal amountofmoney;
	private String remarks;
	private Date expectedarrivaldatel;
	private String deliverynoteattention;
	private Date lastorderdate;
	private String lastordernumber;
	private Date shipdate;
	private Date arrivaldate;
	private Date productdeliverytime;

	List<CYD000001Order> dataList;
}
