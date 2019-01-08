package org.zeus.service;

import org.zeus.bean.Managers;
import org.zeus.bean.Role;
import org.zeus.dmsMapper.ManagersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/4.
 */
@Service
public class ManagerService {
    @Autowired
    ManagersMapper managersMapper;

    public Managers loadUserByUsername(String username){
        return managersMapper.loadUserByUsername(username);
    }

    public List<Role> getRolesById(Long id)
    {
       return managersMapper.getRolesByManagerId(id);
    }

}
