package com.lzz.service.impl;

import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.common.util.UserDetails;
import com.lzz.entity.PasswordResets;
import com.lzz.entity.Users;
import com.lzz.entity.UsersExample;
import com.lzz.form.AccountSearch;
import com.lzz.mapper.UserTodoRepository;
import com.lzz.mapper.UsersMapper;
import com.lzz.service.PasswordResetSendMail;
import com.lzz.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Created by aichaellee on 2018/10/7.
 */
@Service("UserService")
public class UserServiceImpl implements UserService{

    public static final Integer DELETEDUSER = 0;

    @Autowired
    UsersMapper usersMapper;

    @Autowired
    PasswordResetSendMail passwordResetSendMail;

    @Autowired
    UserTodoRepository userTodoRepository;

    @Override
    public ServerResponse<Integer> addUser(Users user) {

        if(!Optional.ofNullable(user).isPresent()){
            throw new RuntimeException("用户信息为空！");
        }

        // 判断用户是否存在，是否曾经注销
        UsersExample usersExample = new UsersExample();
        usersExample.createCriteria().andEmailEqualTo(user.getEmail()).andDeletedflagEqualTo(0);
        List<Users> iuser = usersMapper.selectByExample(usersExample);
        if(!CollectionUtils.isEmpty(iuser)){
            // 用户曾经注册，后来逻辑注销
            if(DELETEDUSER.equals(iuser.get(0).getDeletedflag())){
                // 密码设为初始值
                user.setPassword("defaultPassword");
                // 更新数据库中用户数据
                //TODO
                return ServerResponse.createBySuccessMessage("用户创建成功");
            }else{
                return ServerResponse.createByErrorMessage("该用户已存在！");
            }

        }

        // 根据密码是否为空判定用户为自行注册或是管理员添加
       return registerUser(user);

    }

    private ServerResponse<Integer> registerUser(Users user){

        if(StringUtils.isEmpty(user.getPassword())){
            // 管理员后台添加用户
            // 用户注册
            user.setPassword("defaultPassword");
            usersMapper.insertSelective(user);

            // send mail
            PasswordResets passReset = new PasswordResets();
            passReset.setEmail(user.getEmail());
            passReset.setUserId(user.getId());

            // 发送重置密码邮件
            passwordResetSendMail.sendMail(passReset);
            return ServerResponse.createBySuccessMessage("用户添加成功！");
        }else{

            // 用户注册
            usersMapper.insertSelective(user);

            // 发送用户注册成功邮件
            passwordResetSendMail.sendSuccessMail();
            return ServerResponse.createBySuccessMessage("您已成功注册！");

        }
    }

    @Override
    public ServerResponse<List<Map>> searchUser(AccountSearch accountSearch) {
        List<Map> result =userTodoRepository.SelectUsersByCondition(accountSearch);
        return ServerResponse.createBySuccess(result);
    }

    @Override
    public ServerResponse<Integer> deleteUser(Integer id) {
        userTodoRepository.deleteById(id);
        return ServerResponse.createBySuccessMessage("删除成功");
    }

    @Override
    public ServerResponse<Integer> updateUserInfo(Integer id, Users user) {
        String currentEmail = user.getEmail();
        Users jUser = usersMapper.selectByPrimaryKey(id);
        // 当用户修改了邮箱的时候，对该邮箱进行判断
        if (StringUtils.equals(currentEmail,jUser.getEmail())) {

            UsersExample usersExample = new UsersExample();
            usersExample.createCriteria().andEmailEqualTo(currentEmail);
            List<Users> iuser = usersMapper.selectByExample(usersExample);

            if (!CollectionUtils.isEmpty(iuser)) {
                return ServerResponse.createByErrorMessage("该邮箱已经存在！");

            }
        }
        usersMapper.updateByPrimaryKeySelective(user);
        return ServerResponse.createBySuccessMessage("更新成功");
    }

    @Override
    public ServerResponse<Integer> uploadAvator(Integer id, UserDetails userDetails,MultipartFile[] avatarFile) {

        Users user = new Users();
        if (avatarFile.length > 0) {
            try{
                MultipartFile file = avatarFile[avatarFile.length - 1];
                if (file != null) {
                    byte[] images = file.getBytes();
                    user.setPhoto(images);
                }
            }catch (IOException e){
                return ServerResponse.createByErrorMessage("图片上传失败，请稍后再试!");

            }
            user.setId(id);
            usersMapper.updateByPrimaryKeySelective(user);

            userDetails.getAccount().setPhoto(user.getPhoto());

            return ServerResponse.createBySuccessMessage("头像上传成功");

        }else {
            return ServerResponse.createByErrorMessage("图片上传失败，请稍后再试!");
        }

    }

    @Override
    public ServerResponse<Integer> updateSelfInfo(Users user,UserDetails userDetails) {

        usersMapper.updateByPrimaryKeySelective(user);

        // 把更新完的信息重新填充到userDetails中
        Users newOne = usersMapper.selectByPrimaryKey(user.getId());
        BeanUtils.copyProperties(newOne, userDetails.getAccount());

        return ServerResponse.createBySuccessMessage("您的个人信息已经修改成功");
    }
}
