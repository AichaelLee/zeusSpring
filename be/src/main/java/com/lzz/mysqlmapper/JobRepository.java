package com.lzz.mysqlmapper;

import com.lzz.entity.Users;
import com.lzz.form.AccountSearch;
import com.lzz.mysqlentity.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface JobRepository {

	Job findOneById(int id);



}
