package com.lzz.common.fw.DTO;

/**
 * Created by geely
 */
public enum ResponseCode {

    /**成功*/
    SUCCESS(0,"SUCCESS"),
    /**失败*/
    ERROR(1,"ERROR"),
    /**需要登录*/
    NEED_LOGIN(10,"NEED_LOGIN"),
    /**非法的参数*/
    ILLEGAL_ARGUMENT(2,"ILLEGAL_ARGUMENT");

    private final int code;
    private final String desc;


    ResponseCode(int code, String desc){
        this.code = code;
        this.desc = desc;
    }

    public int getCode(){
        return code;
    }
    public String getDesc(){
        return desc;
    }

}
