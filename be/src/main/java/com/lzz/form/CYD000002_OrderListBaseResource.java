package com.lzz.form;

import lombok.Data;

import java.io.Serializable;

@Data
public class CYD000002_OrderListBaseResource implements Serializable{
	private static final long serialVersionUID = 1L;

//	ご注文日
	private String orderdate;
//	時刻          time
	private String times;
//	ご希望納期    deliverydate
	private String deliverydate;
//	合計金額      totalfee
	private String totalfee;
//	注文ステータス orderstatus
	private String orderstatus;
//	得意先コード     customernumber
	private String customernumber;
//	得意先名称     customername
	private String customername;
//	納入先コード    deliverydestinationcode
	private String deliverydestinationcode;
//	納入先名称     suppliername
	private String suppliername;
//	ご担当者様     dearcustomer
	private String dearcustomer;
//	お客様ご注文No等   customtower
	private String customtower;
//	注文No.        orderno.
	private String orderno;
}
