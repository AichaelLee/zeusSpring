package com.lzz.mapper;

import com.lzz.entity.LoginRegisterdDevices;
import com.lzz.entity.LoginRegisterdDevicesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LoginRegisterdDevicesMapper {
    int countByExample(LoginRegisterdDevicesExample example);

    int deleteByExample(LoginRegisterdDevicesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LoginRegisterdDevices record);

    int insertSelective(LoginRegisterdDevices record);

    List<LoginRegisterdDevices> selectByExample(LoginRegisterdDevicesExample example);

    LoginRegisterdDevices selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LoginRegisterdDevices record, @Param("example") LoginRegisterdDevicesExample example);

    int updateByExample(@Param("record") LoginRegisterdDevices record, @Param("example") LoginRegisterdDevicesExample example);

    int updateByPrimaryKeySelective(LoginRegisterdDevices record);

    int updateByPrimaryKey(LoginRegisterdDevices record);
}