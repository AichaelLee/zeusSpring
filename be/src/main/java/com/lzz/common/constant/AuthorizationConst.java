package com.lzz.common.constant;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public final class AuthorizationConst {

    // 管理角色
    public static final String ADMIN_MANAGE = "ADMIN";
    // 业务员
    public static final String SALESMAN = "SALESMAN";
    // 业务经理
    public static final String SALES_LEADER = "SALES_LEADER";
    // 千代田営業担当
    public static final String TRADE_ASSIATANT = "TRADE_ASSIATANT";
    // 客户leader
    public static final String CUSTOMER_LEADER = "CUSTOMER_LEADER";
    // 客户
    public static final String CUSTOMER = "CUSTOMER";
    // 供货商
    public static final String SUPPLIER = "SUPPLIER";

    // two factor authentication
    public static final String TWE_FACTOR_AUTH = "TWE_FACTOR_AUTH";
    // two factor authentication complete
    public static final String TWE_FACTOR_AUTH_OK = "TWE_FACTOR_AUTH_OK";

String[] arr = new String[]{"aa","bb"};
    String a = arr[1];
    int[] bb = new int[]{1,3};

    public static final Map<Integer, String> AUTHORIZATION_MAP;
    static {
        Map<Integer, String> map = new HashMap<>();
        map.put(10, ADMIN_MANAGE);
        map.put(20, SALESMAN);
        map.put(30, SALES_LEADER);
        map.put(40, TRADE_ASSIATANT);
        map.put(2, CUSTOMER_LEADER);
        map.put(3, CUSTOMER);
        map.put(4, SUPPLIER);
        AUTHORIZATION_MAP = Collections.unmodifiableMap(map);
    }
}
