package org.zeus.dmsMapper;

import java.util.List;
import org.zeus.entity.SysSchool;
import org.zeus.entity.SysSchoolExample;
import org.apache.ibatis.annotations.Param;

public interface SysSchoolMapper {
    int countByExample(SysSchoolExample example);

    int deleteByExample(SysSchoolExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SysSchool record);

    int insertSelective(SysSchool record);

    List<SysSchool> selectByExample(SysSchoolExample example);

    SysSchool selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SysSchool record, @Param("example") SysSchoolExample example);

    int updateByExample(@Param("record") SysSchool record, @Param("example") SysSchoolExample example);

    int updateByPrimaryKeySelective(SysSchool record);

    int updateByPrimaryKey(SysSchool record);
}