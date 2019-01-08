package net.cnki.dmsMapper;

import org.apache.ibatis.annotations.Param;

/**
 * Created by lizhizhong on 2018/12/2.
 */
public interface MenuRoleMapper {
    int deleteMenuByRid(@Param("rid") Long rid);

    int addMenu(@Param("rid") Long rid, @Param("mids") Long[] mids);

    int addDefaultMid(@Param("rid") Long rid);
}
