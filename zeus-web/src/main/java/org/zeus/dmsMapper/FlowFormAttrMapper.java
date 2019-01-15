package org.zeus.dmsMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zeus.entity.FlowFormAttr;
import org.zeus.entity.FlowFormAttrExample;

public interface FlowFormAttrMapper {
    int countByExample(FlowFormAttrExample example);

    int deleteByExample(FlowFormAttrExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlowFormAttr record);

    int insertSelective(FlowFormAttr record);

    List<FlowFormAttr> selectByExample(FlowFormAttrExample example);

    FlowFormAttr selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlowFormAttr record, @Param("example") FlowFormAttrExample example);

    int updateByExample(@Param("record") FlowFormAttr record, @Param("example") FlowFormAttrExample example);

    int updateByPrimaryKeySelective(FlowFormAttr record);

    int updateByPrimaryKey(FlowFormAttr record);
}