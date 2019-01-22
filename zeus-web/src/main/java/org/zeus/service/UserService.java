package org.zeus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lizhizhong on 2018/11/28.
 */
@Service
@Transactional
public class UserService {




    public int updateHrRoles(Long hrId, Long[] rids) {
        return 1;
    }

}
