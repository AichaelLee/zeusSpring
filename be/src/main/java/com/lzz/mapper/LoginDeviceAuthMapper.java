package com.lzz.mapper;

import com.lzz.entity.LoginDeviceAuth;
import com.lzz.entity.LoginDeviceAuthExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LoginDeviceAuthMapper {
    int countByExample(LoginDeviceAuthExample example);

    int deleteByExample(LoginDeviceAuthExample example);

    int insert(LoginDeviceAuth record);

    int insertSelective(LoginDeviceAuth record);

    List<LoginDeviceAuth> selectByExample(LoginDeviceAuthExample example);

    int updateByExampleSelective(@Param("record") LoginDeviceAuth record, @Param("example") LoginDeviceAuthExample example);

    int updateByExample(@Param("record") LoginDeviceAuth record, @Param("example") LoginDeviceAuthExample example);
}