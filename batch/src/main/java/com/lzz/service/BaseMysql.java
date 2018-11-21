package com.lzz.service;

import java.util.List;

/**
 * Created by aichaellee on 2018/9/13.
 */
public interface BaseMysql<T> {

    void insertIntoPostgres(List<T> resultList);


}
