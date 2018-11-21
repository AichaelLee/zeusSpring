package com.lzz.form;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
public class CYD000002_OrderListResource implements Serializable{

	private static final long serialVersionUID = 1L;

//	ご注文日
	@DateTimeFormat(pattern = "yyyy/MM/DD")
	private String orderdateS;
//	ご注文日end
	@DateTimeFormat(pattern = "yyyy/MM/DD")
	private String orderdateE;
	private String orderstatusArr[];
	private String customernameArr[];
	private String dearcustomerArr[];
	private List<CYD000002_OrderListBaseResource> orderListBaseBaseList;

	public CYD000002_OrderListResource(){
		orderListBaseBaseList = new ArrayList<CYD000002_OrderListBaseResource>();
	}
}
