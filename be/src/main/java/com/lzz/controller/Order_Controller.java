package com.lzz.controller;

import com.lzz.common.util.ResultBean;
import com.lzz.form.CYD000001_OrderResource;
import com.lzz.mapper.CYD000001OrderRepository;
import com.lzz.model.CYD000001Order;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Transactional
@RequestMapping(value = "api/v1/orders")
public class Order_Controller {

    @Autowired
    CYD000001OrderRepository orderService;

    @GetMapping(value = "")
    @ResponseStatus(HttpStatus.OK)
    public List<HashMap<Object, Object>> index() {
        return orderService.findCustomername();
    }

    @GetMapping(value = "customer/{id}")
    @ResponseStatus(HttpStatus.OK)
    public List<Map<Object, Object>> index(@PathVariable String id) {
        List<String> suppliernameList = orderService.findSuppliernameByfindCustomer(Long.valueOf(id));
        List<Map<Object, Object>> list = new ArrayList<>();
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        for (String suppliername : suppliernameList) {
            CYD000001Order parmResource = new CYD000001Order();
            parmResource.setCustnumber(Long.valueOf(id));
            parmResource.setSuppliername(suppliername);
            List<HashMap<Object, Object>> tblMapList = orderService.findProducts(parmResource);
            dataMap = new HashMap<Object, Object>();
            dataMap.put("suppliername", suppliername);
            dataMap.put("dataList", tblMapList);
            dataMap.put("addressee", tblMapList.get(0).get("addressee"));
            list.add(dataMap);
        }
        return list;
    }


    @PostMapping(value = "customer/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResultBean productsInsert(
        @RequestBody CYD000001_OrderResource formBean
    ) {
        ResultBean resultBean = new ResultBean();

        List<CYD000001_OrderResource> formList = formBean.getDataList() == null ? new ArrayList<>() : formBean.getDataList();
        for (int i = 0; i < formList.size(); i++) {
            CYD000001_OrderResource order = formList.get(i);
            CYD000001Order parmResource = new CYD000001Order();
            BeanUtils.copyProperties(order, parmResource);
            orderService.updataOrder(parmResource);
        }
        resultBean.setResultMsg("无订单！");
        return resultBean;
    }
}
