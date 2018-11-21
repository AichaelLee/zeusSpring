package com.lzz.mapper;

import com.lzz.entity.TAccessLog;

import java.util.List;

public interface TAccessLogRepository {

	int insertLog(TAccessLog tAccessLog);

	List<TAccessLog> searchLogById(Integer id);

	int deleteWrongRecords(Integer id);

	int updateLogAccountStatus(TAccessLog tAccessLog);

}
