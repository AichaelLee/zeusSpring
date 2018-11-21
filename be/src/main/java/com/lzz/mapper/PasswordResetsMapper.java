package com.lzz.mapper;

import com.lzz.entity.PasswordResets;
import com.lzz.entity.PasswordResetsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PasswordResetsMapper {
    int countByExample(PasswordResetsExample example);

    int deleteByExample(PasswordResetsExample example);

    int insert(PasswordResets record);

    int insertSelective(PasswordResets record);

    List<PasswordResets> selectByExample(PasswordResetsExample example);

    int updateByExampleSelective(@Param("record") PasswordResets record, @Param("example") PasswordResetsExample example);

    int updateByExample(@Param("record") PasswordResets record, @Param("example") PasswordResetsExample example);
}