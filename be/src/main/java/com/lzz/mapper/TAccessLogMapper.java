package com.lzz.mapper;

import com.lzz.entity.TAccessLog;
import com.lzz.entity.TAccessLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TAccessLogMapper {
    int countByExample(TAccessLogExample example);

    int deleteByExample(TAccessLogExample example);

    int insert(TAccessLog record);

    int insertSelective(TAccessLog record);

    List<TAccessLog> selectByExample(TAccessLogExample example);

    int updateByExampleSelective(@Param("record") TAccessLog record, @Param("example") TAccessLogExample example);

    int updateByExample(@Param("record") TAccessLog record, @Param("example") TAccessLogExample example);
}