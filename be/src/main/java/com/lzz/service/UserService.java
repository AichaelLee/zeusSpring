package com.lzz.service;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.common.util.UserDetails;
import com.lzz.entity.Users;
import com.lzz.form.AccountSearch;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created by aichaellee on 2018/10/7.
 */
public interface UserService {

    ServerResponse<Integer> addUser(Users user);

    ServerResponse<List<Map>> searchUser(AccountSearch accountSearch);

    ServerResponse<Integer> deleteUser(Integer id);

    ServerResponse<Integer> updateUserInfo(Integer id,Users users);

    ServerResponse<Integer> updateSelfInfo(Users users,UserDetails userDetails);

    ServerResponse<Integer> uploadAvator(Integer id, UserDetails userDetails, MultipartFile[] avatarFile);


}
