package com.lzz.form;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class CYD000001_OrderResource implements Serializable{
	private static final long serialVersionUID = 1L;

    public interface suppliernameChk {
    }

    public interface enterChk {
    }

    // 得意先名称
	@NotEmpty
	private String customername;
	private Long custnumber;
	// 納入先名称
	@NotEmpty(groups = suppliernameChk.class)
	private String suppliername;
	// お客様ご注文No等
	private Long customerorderno;
	// お届け先
	private String addressee;
	// ご担当者様
	private String dearcustomer;
	// ご注文日
	private Date orderdate;
	// ご希望納期
	@NotNull(groups = enterChk.class)
	private Date deliverydate;
	// 合計金額
	private BigDecimal totalfee;
	// ステータス
	private Long status;
	// お客様備考
	@Size(max=30, groups = enterChk.class)
	private String customerremarks;
	// Myオーダーシート
	private Long myordersheet;
	// 購入履歴
	private String purchasehistory;
	// 商品コード
	private Long productcode;
	// 品名   /規格
	private String itemname;
	// 入数   /発注単位
	private Long quantity;
	// ご注文数
//	@NotEmpty(groups = enterChk.class)
//	@Size(max=4, groups = enterChk.class)
	private String numberoforders;
	// 総数
	private Long totalnumber;
	// 単価
	private BigDecimal unitprice;
	// 金額
	private BigDecimal amountofmoney;
	// 備考
//	@Size(max=30, groups = enterChk.class)
	private String remarks;
	// 着荷予定日
	private Date expectedarrivaldatel;
	// 納期注意
	private String deliverynoteattention;
	// 前回ご注文日
	private Date lastorderdate;
	// 前回ご注文数
	private String lastordernumber;
	// 出荷日
	private Date shipdate;
	// 着荷日
	private Date arrivaldate;
	// 商品納期
	private Date productdeliverytime;

	List<CYD000001_OrderResource> dataList;
}
