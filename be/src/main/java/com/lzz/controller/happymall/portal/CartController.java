package com.lzz.controller.happymall.portal;



import com.lzz.common.constant.Const;
import com.lzz.common.fw.DTO.ResponseCode;
import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.common.util.UserDetails;
import com.lzz.entity.happymall.User;
import com.lzz.entity.happymall.vo.CartVo;
import com.lzz.service.happymall.ICartService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by geely
 */
@Controller
@RequestMapping("api/v1/mall/cart/")
@Api(value = "商城购物车模块")
public class CartController {

    @Autowired
    private ICartService iCartService;



    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<CartVo> list(@AuthenticationPrincipal UserDetails user){

        return iCartService.list(user.getAccount().getId());
    }

    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse<CartVo> add(@AuthenticationPrincipal UserDetails user, Integer count, Integer productId){

        return iCartService.add(user.getAccount().getId(),productId,count);
    }



    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse<CartVo> update(@AuthenticationPrincipal UserDetails user, Integer count, Integer productId){

        return iCartService.update(user.getAccount().getId(),productId,count);
    }

    @RequestMapping("delete_product.do")
    @ResponseBody
    public ServerResponse<CartVo> deleteProduct(@AuthenticationPrincipal UserDetails user, String productIds){

        return iCartService.deleteProduct(user.getAccount().getId(),productIds);
    }


    @RequestMapping("select_all.do")
    @ResponseBody
    public ServerResponse<CartVo> selectAll(@AuthenticationPrincipal UserDetails user){

        return iCartService.selectOrUnSelect(user.getAccount().getId(),null,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select_all.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelectAll(@AuthenticationPrincipal UserDetails user){

        return iCartService.selectOrUnSelect(user.getAccount().getId(),null,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("select.do")
    @ResponseBody
    public ServerResponse<CartVo> select(@AuthenticationPrincipal UserDetails user, Integer productId){

        return iCartService.selectOrUnSelect(user.getAccount().getId(),productId,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelect(@AuthenticationPrincipal UserDetails user, Integer productId){

        return iCartService.selectOrUnSelect(user.getAccount().getId(),productId,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("get_cart_product_count.do")
    @ResponseBody
    public ServerResponse<Integer> getCartProductCount(@AuthenticationPrincipal UserDetails user){

        return iCartService.getCartProductCount(user.getAccount().getId());
    }




    //全选
    //全反选

    //单独选
    //单独反选

    //查询当前用户的购物车里面的产品数量,如果一个产品有10个,那么数量就是10.




}
