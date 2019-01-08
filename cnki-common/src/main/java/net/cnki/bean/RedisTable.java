package net.cnki.bean;

import lombok.Data;

import java.util.Date;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/6.
 */
@Data
public class RedisTable {
    //保存redis的主键ID
    private Long redisId;
    //redis的类型如：set/list/hash/sortedset/string
    private String redisType;
    //保存redis时使用的key
    private String redisKey;
    //此属性主要用于hash数据结构时，保存member的
    private String objectName;
    //存储的redis的值
    private String redisValue;
    //保存Token时，为区分拼接的字符串
    private String keyToken;
    //此属性为sortedset数据结构时，保存的score值
    private String score;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //redis的IP地址  当然此处也可以存储mac地址
    private String macIp;
    //redis使用的端口号
    private String port;
    //应用区分码
    private String appCode;
    //备注
    private String remark;
    //是否修改。此属性可以用于增量备份时，即在每个redis存储时可以更具key多存储一个属性isModify。 如果有修改，则置为 Y,否则为N.
    private String isModify;


}