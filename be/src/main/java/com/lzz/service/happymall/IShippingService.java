package com.lzz.service.happymall;


import com.github.pagehelper.PageInfo;
import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.entity.happymall.Shipping;


/**
 * Created by geely
 */
public interface IShippingService {

    ServerResponse add(Integer userId, Shipping shipping);
    ServerResponse<String> del(Integer userId, Integer shippingId);
    ServerResponse update(Integer userId, Shipping shipping);
    ServerResponse<Shipping> select(Integer userId, Integer shippingId);
    ServerResponse<PageInfo> list(Integer userId, int pageNum, int pageSize);

}
