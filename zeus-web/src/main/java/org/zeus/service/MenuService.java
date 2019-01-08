package org.zeus.service;

import org.zeus.bean.Menu;
import org.zeus.common.UserUtils;
import org.zeus.dmsMapper.MenuMapper;
import org.zeus.dto.MenuUpdateForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
//@CacheConfig(cacheNames = "menus_cache")
public class MenuService {
    @Autowired
    MenuMapper menuMapper;

////    @Cacheable(key = "#root.methodName")
//    @Cacheable(key = "#root.methodName")
    public List<Menu> getAllMenu(){
        return menuMapper.getAllMenu();
    }
//    @Cacheable(key = "#root.methodName")
    public List<Menu> getMenusByUserId() {
        return menuMapper.getMenusByUserId(UserUtils.getCurrentUser().getId());
    }
//    @Cacheable(key = "#root.methodName")
    public List<Menu> menuTree() {
        return menuMapper.menuTree();
    }

//    @Cacheable(key = "#root.methodName")
    public List<Long> getMenusByRid(Long rid) {
        return menuMapper.getMenusByRid(rid);
    }

//    @Cacheable(key = "#root.methodName")
    public List<Menu> getMemusInfoByRid(Long rid){
        return menuMapper.getMemusInfoByRid(rid);
    }

    public int updateMenuByMid(MenuUpdateForm menu){
        return menuMapper.updateMenuByMid(menu);
    }

    /**
     * 根据菜单id获得该条详细信息
     * @param id
     * @return
     */
    public Menu getMenuByMid(Long id){
        return menuMapper.getMenuByMid(id);
    }
}
