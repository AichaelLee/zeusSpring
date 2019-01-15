package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowStep;
import org.zeus.entity.FlowStepExample;

public interface FlowStepMapper {
    int countByExample(FlowStepExample example);

    int deleteByExample(FlowStepExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowStep record);

    int insertSelective(FlowStep record);

    List<FlowStep> selectByExample(FlowStepExample example);

    FlowStep selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowStep record, @Param("example") FlowStepExample example);

    int updateByExample(@Param("record") FlowStep record, @Param("example") FlowStepExample example);

    int updateByPrimaryKeySelective(FlowStep record);

    int updateByPrimaryKey(FlowStep record);
}