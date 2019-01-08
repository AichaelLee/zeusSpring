package net.cnki.common.util;

import net.cnki.bean.RedisTable;
import redis.clients.jedis.Jedis;

import java.util.Date;
import java.util.Iterator;
import java.util.Set;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/6.
 */
public class RedisPersistence {
    /**
     * 存储所有的redis对象方法
     */
    public static void saveAllRedis(final String redisIp,final int redisPort,final String appCode) {
        Jedis redis = new Jedis(redisIp, redisPort);// 连接redis
         redis.auth("123456");//验证密码
        // KEY操作
        Set keys = redis.keys("*");// 列出所有的key，查找特定的key如：redis.keys("foo")
        Iterator t1 = keys.iterator();
        while (t1.hasNext()) {
            Object obj1 = t1.next();
            saveRedisObject(redis, obj1 + "", redisIp, redisPort + "", appCode);
        }
    }

    /**
     * 存储单个对象
     * @param redis
     * @param redisKey
     * @param macIp
     * @param port
     * @param appCode
     */
    private static void saveRedisObject(final Jedis redis, final String redisKey, final String macIp, final String port, final String appCode) {
        String redisType = redis.type(redisKey);
        RedisTable redisTable = new RedisTable();
        redisTable.setAppCode(appCode);
        redisTable.setCreateTime(new Date());
        redisTable.setMacIp(macIp);
        redisTable.setPort(port);
        redisTable.setRedisKey(redisKey);
        redisTable.setRedisType(redisType);
        redisTable.setRemark("");
        redisTable.setUpdateTime(new Date());
        //set集合
        if("set".equalsIgnoreCase(redisType)){
            Set<String> setStrings  = redis.smembers(redisKey);//获取key的所有set集合
            if(null != setStrings && !setStrings.isEmpty()){
                Iterator setIterator = setStrings.iterator() ;
                while(setIterator.hasNext()){
                    Object obj1 = setIterator.next();
                    redisTable.setRedisValue(obj1+"");
                    printRedis(redisTable);//保存每一个set记录
                }
            }
            //hash集合
        }else if("hash".equalsIgnoreCase(redisType)){
            Set<String> hashSets = redis.hkeys(redisKey);
            if(null != hashSets && !hashSets.isEmpty()){
                Iterator setIterator = hashSets.iterator() ;
                while(setIterator.hasNext()){
                    String objectName = setIterator.next()+"";
                    redisTable.setObjectName(objectName);
                    redisTable.setRedisValue(redis.hget(redisKey, objectName));
                    printRedis(redisTable);//保存每一个set记录
                }
            }
            //list集合
        }else if("list".equalsIgnoreCase(redisType)){
            Long listLen = redis.llen(redisKey);
            for (Long i = 0L; i < listLen; i++) {
                redisTable.setRedisValue(redis.lindex(redisKey, i));
                printRedis(redisTable);
            }
            //sortedset集合
        }else if("sortedset".equalsIgnoreCase(redisType)){
//          Long redisLenth = redis.zcard(redisKey);
            Set<String> sortedsets = redis.zrange(redisKey, 0, -1);
            if(null != sortedsets && !sortedsets.isEmpty()){
                Iterator setIterator = sortedsets.iterator() ;
                while(setIterator.hasNext()){
                    String sortedMember = setIterator.next() +"";
                    redisTable.setRedisValue(sortedMember);
                    redisTable.setScore("" +redis.zscore(redisKey, sortedMember));
                    printRedis(redisTable);//保存每一个sortedset记录
                }
            }
            //string集合
        }else if("string".equalsIgnoreCase(redisType)){
            redisTable.setRedisValue(redis.get(redisKey));
            printRedis(redisTable);//保存记录
        }else{
            System.out.println("UnknowRedisType-----redisType: " +redisType+"      objValue: "+redis.get(redisKey));
        }
    }

    //打印输出
    public static void printRedis (RedisTable redisTable) {
        System.out.println("redisType:"+redisTable.getRedisType()
                + " redisKey:"+redisTable.getRedisKey()
                + " ObjectName:"+redisTable.getObjectName()
                + " redisValue:"+redisTable.getRedisValue()
                + " redisScore:"+redisTable.getScore()
        );
    }

    public static void main(String[] args) {
        //redis的IP地址
        String redisIp = "127.0.0.1";
        //redis的端口号
        int redisPort = 6379;
        //根据不同的应用区分的appcode
        String appCode = "FUYOU";
       // Jedis jedis = new Jedis("127.0.0.1",6379);
        //jedis.auth("123456");
        saveAllRedis(redisIp,redisPort,appCode);
    }
}