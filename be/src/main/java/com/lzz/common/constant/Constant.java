package com.lzz.common.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统固有的常量类
 * @author aichaellee
 */
public final class Constant {

    // アプリの動作環境
    /** 本机环境 */
    public static final String OPERATING_ENV_PRODUCT = "1";
    /** 开发环境 */
    public static final String OPERATING_ENV_DEVELOP = "0";

    public static final String OPERATION_LOG_ID = "[OPERATION_LOG_ID]";
    public static final String OPERATION_START = "[OPERATION_START]";
    public static final String OPERATION_END = "[OPERATION_END]";
    public static final String OPERATION_ID = "OPERATION_ID";
    public static final String OPERATION_PARAMS = "OPERATION_PARAMS";
    public static final String OPERATION_DURATION = "OPERATION_DURATION";

    /** 订单状态: 1:暂时保存; 2:可以修改; 3:货物配送; 4:交易完成*/
    public static final Map<String, String> STATUS_MAP;
    static
    {
    	STATUS_MAP = new HashMap<String, String>();
    	STATUS_MAP.put("1", "暂时保存");
    	STATUS_MAP.put("2", "可以修改");
    	STATUS_MAP.put("3", "货物配送");
    	STATUS_MAP.put("4", "交易完成");
    }
}
