package com.lzz.controller;

import com.lzz.common.constant.Constant;
import com.lzz.common.util.ResultBean;
import com.lzz.form.CYD000002_OrderListResource;
import com.lzz.mapper.CYD000002OrderListRepository;
import com.lzz.model.CYD000002OrderList;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Transactional
@RequestMapping(value = "api/v1/orderslist")
public class CYD000002_OrderList {

	@Autowired
    CYD000002OrderListRepository orderListService;

	@GetMapping(value = "")
    @ResponseStatus(HttpStatus.OK)
	public ResultBean index(){

		ResultBean resultBean = new ResultBean();
		resultBean.getModelBeanMap().put("STATUS_MAP", Constant.STATUS_MAP);
		resultBean.getModelBeanMap().put("customername", orderListService.findCustomername());
		resultBean.getModelBeanMap().put("dearcustomer", orderListService.findDearcustomer());
		return resultBean;
	}

	@GetMapping(value = "inquire")
    @ResponseStatus(HttpStatus.OK)
	public ResultBean orderInquire(@Validated @ModelAttribute("CYD000002_OrderListResource") CYD000002_OrderListResource form){
		CYD000002OrderList parmResource = new CYD000002OrderList();
        BeanUtils.copyProperties(form, parmResource);
		ResultBean resultBean = new ResultBean();
		resultBean.getModelBeanMap().put("resultList", orderListService.findDetailByCondition(parmResource));
		return resultBean;
	}
}
