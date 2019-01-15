package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowAttr;
import org.zeus.entity.FlowAttrExample;

public interface FlowAttrMapper {
    int countByExample(FlowAttrExample example);

    int deleteByExample(FlowAttrExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowAttr record);

    int insertSelective(FlowAttr record);

    List<FlowAttr> selectByExample(FlowAttrExample example);

    FlowAttr selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowAttr record, @Param("example") FlowAttrExample example);

    int updateByExample(@Param("record") FlowAttr record, @Param("example") FlowAttrExample example);

    int updateByPrimaryKeySelective(FlowAttr record);

    int updateByPrimaryKey(FlowAttr record);
}