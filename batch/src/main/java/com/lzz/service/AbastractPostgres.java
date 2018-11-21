package com.lzz.service;

import com.lzz.entity.BaseBean;
import com.lzz.entity.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.List;

/**
 * Created by aichaellee on 2018/9/13.
 */
public abstract class AbastractPostgres<T extends BaseBean> {

    //output log
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public List<T> selectFromPostgres(T entity,Date lastSyncTime) throws Exception {
        // start time record
        long start = System.currentTimeMillis();

        // select data by filterCondition

//        T t = clazz.newInstance();
        entity.setLastUpdatedTime(lastSyncTime);

        List<T> resultList = null;

        if (logger.isDebugEnabled()) {
            logger.debug("all time is {}",entity.getClass());
        }
        return resultList;
    }


}
