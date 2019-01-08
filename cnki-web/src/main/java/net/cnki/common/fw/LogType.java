package net.cnki.common.fw;

/**
 * 日志类型
 * @author: lizhizhong
 * CreatedDate: 2018/12/04.
 */

public enum LogType {

    /**
     * 默认0操作
     */
    OPERATION(0,"流程操作"),

    /**
     * 1登录
     */
    LOGIN(1,"登录操作"),

    /**
     * 2 删除
     */
    DELETE(2,"删除操作"),

    /**
     * 3 更改
     */
    UPDATE(3,"更改操作"),

    /**
     * 审核
     */
    AUDITING(4,"审核操作"),

    /**
     * 检测
     */
    DETECTION(5,"检测操作"),

    /**
     * 课题相似性
     */
    TOPIC_SIMILARITY(6,"相关性操作");

    private int code;
    private String desc;

    LogType(int code,String desc){
        this.code = code;
        this.desc = desc;
    }

    public String getDesc(){
        return this.desc;
    }
}
