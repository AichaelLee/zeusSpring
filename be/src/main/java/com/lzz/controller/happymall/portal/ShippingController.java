package com.lzz.controller.happymall.portal;

import com.github.pagehelper.PageInfo;
import com.lzz.common.constant.Const;
import com.lzz.common.fw.DTO.ResponseCode;
import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.common.util.UserDetails;
import com.lzz.entity.happymall.Shipping;
import com.lzz.entity.happymall.User;
import com.lzz.service.happymall.IShippingService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by geely
 */

@Controller
@RequestMapping("api/v1/mall/shipping/")
@Api(value = "商城发货模块")
public class ShippingController {


    @Autowired
    private IShippingService iShippingService;


    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse add(@AuthenticationPrincipal UserDetails user, Shipping shipping){

        return iShippingService.add(user.getAccount().getId(),shipping);
    }


    @RequestMapping("del.do")
    @ResponseBody
    public ServerResponse del(@AuthenticationPrincipal UserDetails user, Integer shippingId){

        return iShippingService.del(user.getAccount().getId(),shippingId);
    }

    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse update(@AuthenticationPrincipal UserDetails user, Shipping shipping){

        return iShippingService.update(user.getAccount().getId(),shipping);
    }


    @RequestMapping("select.do")
    @ResponseBody
    public ServerResponse<Shipping> select(@AuthenticationPrincipal UserDetails user, Integer shippingId){

        return iShippingService.select(user.getAccount().getId(),shippingId);
    }


    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10")int pageSize,
                                         @AuthenticationPrincipal UserDetails user){

        return iShippingService.list(user.getAccount().getId(),pageNum,pageSize);
    }














}
