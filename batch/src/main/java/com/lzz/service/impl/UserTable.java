package com.lzz.service.impl;

import com.lzz.entity.Users;
import com.lzz.service.AbastractPostgres;

import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * Created by aichaellee on 2018/9/13.
 */
public class UserTable extends AbastractPostgres<Users> {

    @Override
    public List<Users> selectFromPostgres(Users uses,Date lastSync) throws Exception{
        return super.selectFromPostgres(uses,lastSync);
    }


}
