package org.zeus.service;

import org.zeus.common.ServerResponse;
import org.zeus.dto.UserRegister;

/**
 * Created by aichaellee on 2018/10/7.
 */
public interface SystemUserService {

    ServerResponse<Integer> addUser(UserRegister user);

    //ServerResponse<List<Map>> searchUser(AccountSearch accountSearch);

//    ServerResponse<Integer> deleteUser(Integer id);
//
//    ServerResponse<Integer> updateUserInfo(Integer id, TblTeacherBase users);

    //ServerResponse<Integer> updateSelfInfo(Users users, UserDetails userDetails);

   // ServerResponse<Integer> uploadAvator(Integer id, UserDetails userDetails, MultipartFile[] avatarFile);


}
