package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowFormContent;
import org.zeus.entity.FlowFormContentExample;

public interface FlowFormContentMapper {
    int countByExample(FlowFormContentExample example);

    int deleteByExample(FlowFormContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowFormContent record);

    int insertSelective(FlowFormContent record);

    List<FlowFormContent> selectByExample(FlowFormContentExample example);

    FlowFormContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowFormContent record, @Param("example") FlowFormContentExample example);

    int updateByExample(@Param("record") FlowFormContent record, @Param("example") FlowFormContentExample example);

    int updateByPrimaryKeySelective(FlowFormContent record);

    int updateByPrimaryKey(FlowFormContent record);
}