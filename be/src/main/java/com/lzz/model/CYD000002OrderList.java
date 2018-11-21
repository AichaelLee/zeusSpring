package com.lzz.model;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

@Data
public class CYD000002OrderList {

	public Long id;
//	ご注文日
	private Date orderdate;
//	ご注文日end
	private Date orderdateEnd;
//	時刻          time
	private Timestamp times;
//	ご希望納期    deliverydate
	private Date  deliverydate;
//	合計金額      totalfee
	private BigDecimal totalfee;
//	注文ステータス orderstatus
	private Long orderstatus;
	private Long orderstatusArr[];
//	得意先コード     customernumber
	private Long customernumber;
//	得意先名称     customername
	private String customername;
	private String customernameArr[];
//	納入先コード    deliverydestinationcode
	private Long deliverydestinationcode;
//	納入先名称     suppliername
	private String suppliername;
//	ご担当者様     dearcustomer
	private String dearcustomer;
	private String dearcustomerArr[];
//	お客様ご注文No等   customtower
	private Long customtower;
//	注文No.        orderno.
	private Long orderno;
}
