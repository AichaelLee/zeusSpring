package org.zeus.dmsMapper;

import org.apache.ibatis.annotations.Param;
import org.zeus.bean.Role;

import java.util.List;

/**
 * Created by aichaellee on 2019/1/9.
 */
public interface CommonMapper {

    /**
     * 更新form表（数据库中以form开头的表）
     * @param sql
     * @return
     */
    int updateExecute(String sql);

    /**
     * 查询form表
     * @param sql
     * @param <T>
     * @return
     */
    <T> List<T>  select(String sql);

    /**
     * 新增form表中的数据
     * @param sql
     * @return
     */
    int addExecute(String sql);
}
