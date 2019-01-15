package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowStepCheckState;
import org.zeus.entity.FlowStepCheckStateExample;

public interface FlowStepCheckStateMapper {
    int countByExample(FlowStepCheckStateExample example);

    int deleteByExample(FlowStepCheckStateExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowStepCheckState record);

    int insertSelective(FlowStepCheckState record);

    List<FlowStepCheckState> selectByExample(FlowStepCheckStateExample example);

    FlowStepCheckState selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowStepCheckState record, @Param("example") FlowStepCheckStateExample example);

    int updateByExample(@Param("record") FlowStepCheckState record, @Param("example") FlowStepCheckStateExample example);

    int updateByPrimaryKeySelective(FlowStepCheckState record);

    int updateByPrimaryKey(FlowStepCheckState record);
}