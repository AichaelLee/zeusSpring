package com.lzz.mapper;


import com.lzz.model.CYD000002OrderList;

import java.util.List;

public interface CYD000002OrderListRepository {

	List<String> findCustomername();

	List<String> findDearcustomer();

	List<CYD000002OrderList> findDetailByCondition(CYD000002OrderList orderList);
}
