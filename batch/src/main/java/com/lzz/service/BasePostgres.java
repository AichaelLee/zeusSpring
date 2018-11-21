package com.lzz.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by aichaellee on 2018/9/13.
 */
public interface BasePostgres<T> {

    List<T> selectFromPostgres(Date lastSyncTime) throws Exception;
}
