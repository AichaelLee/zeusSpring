package com.lzz.common.util;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class ResultBean {

	Map<Object, Object> modelBeanMap;

	Map<Object, Object> massegeMap;

	Object resultMsg;

	public ResultBean(){

		modelBeanMap = new HashMap<>();

		massegeMap = new HashMap<>();
	}
}
