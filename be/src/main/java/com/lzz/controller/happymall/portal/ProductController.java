package com.lzz.controller.happymall.portal;

import com.github.pagehelper.PageInfo;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.entity.happymall.vo.ProductDetailVo;
import com.lzz.service.happymall.IProductService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by geely
 */

@Controller
@RequestMapping("api/v1/mall/product/")
@Api(value = "商城商品模块")
public class ProductController {

    @Autowired
    private IProductService iProductService;



    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<ProductDetailVo> detail(Integer productId){
        return iProductService.getProductDetail(productId);
    }

    //@RequestParam 是从request里面拿取值，
    // 而 @PathVariable 是从一个URI模板里面来填充,比如"/hello/{id}"，想去的id的值
    //就要使用@PathVariable

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "keyword",required = false)String keyword,
                                         @RequestParam(value = "categoryId",required = false)Integer categoryId,
                                         @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
                                         @RequestParam(value = "orderBy",defaultValue = "") String orderBy){
        return iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
    }





}
