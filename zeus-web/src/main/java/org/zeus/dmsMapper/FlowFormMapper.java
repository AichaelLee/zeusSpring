package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowForm;
import org.zeus.entity.FlowFormExample;

public interface FlowFormMapper {
    int countByExample(FlowFormExample example);

    int deleteByExample(FlowFormExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowForm record);

    int insertSelective(FlowForm record);

    List<FlowForm> selectByExample(FlowFormExample example);

    FlowForm selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowForm record, @Param("example") FlowFormExample example);

    int updateByExample(@Param("record") FlowForm record, @Param("example") FlowFormExample example);

    int updateByPrimaryKeySelective(FlowForm record);

    int updateByPrimaryKey(FlowForm record);
}