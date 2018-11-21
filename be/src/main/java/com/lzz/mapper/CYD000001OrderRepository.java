package com.lzz.mapper;

import com.lzz.model.CYD000001Order;

import java.util.HashMap;
import java.util.List;

//接口的全名就是xml中的namespace中的名字，方法名就是映射文件中的id的名字，参数就是传递给sql的参数
//mapper接口是没有实现类的，当调用接口方法时，
// 接口全名+方法名拼接字符串作为key值，可唯一定位一个MappedStatement
//在Mybatis中，每一个<select>、<insert>、<update>、<delete>标签，都会被解析为一个MappedStatement对象。

public interface CYD000001OrderRepository {

	List<HashMap<Object,Object>> findCustomername();

	List<String> findSuppliernameByfindCustomer(Long customername);

	List<HashMap<Object, Object>> findProducts(CYD000001Order order);

	int customerordernoCount(CYD000001Order order);

	int insertOrder(List dataList);

	void updataOrder(CYD000001Order order);
}
