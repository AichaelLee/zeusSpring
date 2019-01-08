package net.cnki.dmsMapper;

import net.cnki.entity.HibernateSequences;
import net.cnki.entity.HibernateSequencesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HibernateSequencesMapper {
    int countByExample(HibernateSequencesExample example);

    int deleteByExample(HibernateSequencesExample example);

    int insert(HibernateSequences record);

    int insertSelective(HibernateSequences record);

    List<HibernateSequences> selectByExample(HibernateSequencesExample example);

    int updateByExampleSelective(@Param("record") HibernateSequences record, @Param("example") HibernateSequencesExample example);

    int updateByExample(@Param("record") HibernateSequences record, @Param("example") HibernateSequencesExample example);
}