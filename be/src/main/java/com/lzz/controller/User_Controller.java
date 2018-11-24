package com.lzz.controller;

import com.lzz.common.annotation.SystemLog;
import com.lzz.common.fw.DTO.ServerResponse;
import com.lzz.common.util.RedisUtil;
import com.lzz.common.util.UserDetails;
import com.lzz.dao.UserJpaDao;
import com.lzz.entity.Users;
import com.lzz.form.AccountSearch;
import com.lzz.form.GSC010101_PasswordResetResource;
import com.lzz.mapper.TAccessLogMapper;
import com.lzz.mapper.TAccessLogRepository;
import com.lzz.mapper.UserTodoRepository;
import com.lzz.mapper.UsersMapper;
import com.lzz.mysqlmapper.JobRepository;
import com.lzz.service.AccountService;
import com.lzz.service.PasswordResetSendMail;
import com.lzz.service.PasswordService;
import com.lzz.service.UserService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Transactional
@RequestMapping(value = "api/v1/user")
@Api(value = "用户的增删改查")
@Slf4j

public class User_Controller {

    @Autowired
    UsersMapper usersMapper;

    @Autowired
    TAccessLogMapper tAccessLogMapper;

    @Autowired
    UserTodoRepository userTodoRepository;

    @Autowired
    TAccessLogRepository tAccessLogRepository;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    PasswordResetSendMail passwordResetSendMail;

    @Autowired
    UserJpaDao userJpaDao;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private UserService userservice;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private AccountService accountService;

    /**
     * user create
     */
    @PostMapping(value = "/user")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> addUser(@AuthenticationPrincipal UserDetails userDetails, @Validated Users user) {

       return userservice.addUser(user);

    }

    /** user search
     * @Param search condition
     * */
    @GetMapping(value = "/search")
    @SystemLog
    public ServerResponse<List<Map>> SearchUsers(AccountSearch accountSearch) {

//        Job job = jobRepository.findOneById(1);
//        System.out.println("************job to string is"+job.toString());
//        Users result  = userJpaDao.findByName("李志钟");
//        System.out.println("******result is {}"+result.getName());
//        //List<String> allFiles = AmazonS3Util.listAll("lzz-wordpress");
//        //allFiles.forEach(file->{
//          //  System.out.println("all s3 file is :"+ file);
//       // });
//
//        //test redis
//        redisUtil.set("redisUtil","test Redis Util");
//        String redisGet = redisUtil.get("redisUtil");
//        log.info("redis Util get value is {}",redisGet);
//
//        User user = new User(1,"name","q@q.vom","klj");
//        User user2 = new User(2,"name","hjklhq@q.vom","klhjkj");
//        log.info("is true or fasle {}",user.equals(user2));
//        List<User> li = new ArrayList<>();
//        li.add(user);
//        li.add(user2);
//        ObjectMapper objectMapper = new ObjectMapper();
//        String s = objectMapper.writeValueAsString(li);
//
//        redisUtil.set("user",s);
//        log.info("the user list is {}",redisUtil.get("user"));

       return userservice.searchUser(accountSearch);
    }

    /**
     *  user delete
     *  @Param deleted user id
     *  */
    @DeleteMapping(value = "{id}")
    public ServerResponse<Integer> index(@PathVariable Integer id) {
       return userservice.deleteUser(id);
    }

    /** admin user update
     * 管理员对用户个人信息进行修改
     * TODO 这里后期要进行改动，个人修改和管理员修改
     *
     * */
    @PutMapping(value = "{id}")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> updateUserInfo(@PathVariable Integer id, Users user) {

       return userservice.updateUserInfo(id,user);
    }

    /**
     * 忘记密码
     * TODO 这里有前台传来的一个ID，实际上个人忘记密码是得不到id，只有邮箱的
     *
     * */
    @GetMapping(value = "/passwordForget")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> passwordReset(Users user) {
        return passwordService.forgetPassword(user);

    }
    /**
     * portal personnel user avatar upload
     * 上传头像
     *
     * */
    @PostMapping(value = "/person/avatar/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> uploadAvatar(@PathVariable Integer id,
                                               @AuthenticationPrincipal UserDetails userDetails,
                                               @RequestParam("photo") MultipartFile[] avatarFile) throws IOException {
        return userservice.uploadAvator(id,userDetails,avatarFile);
    }

    /** portal personnel user update
     *
     * 用户信息更新
     * **/
    @PutMapping(value = "person/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> updateSelfInfo(@AuthenticationPrincipal UserDetails userDetails,
                                               @PathVariable Integer id,
                                               Users user) throws IOException {
        return userservice.updateSelfInfo(user,userDetails);
    }

    /**
     * lock the account
     * **/


    @PutMapping(value = "lockedAccount/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> lockAccount(@PathVariable Integer id) throws IOException {

        return accountService.lockAccount(id);
    }

    /**
     * unlock the account when unmatch password more than 5 times between 30
     **/
    @PutMapping(value = "unLockedAccount/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ServerResponse<Integer> accountUnlock(@PathVariable Integer id) throws IOException {
        return accountService.unlockAccount(id);
    }

    // self passwordReset
    @PutMapping(value = "PWReset/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Map<String, Object> selfPwReset(
        @Validated(GSC010101_PasswordResetResource.PasswordChk.class) @ModelAttribute("PasswordResource") GSC010101_PasswordResetResource form,
        BindingResult bindingResult, @PathVariable Integer id, String oldPassword
    ) {
        Users oldpass = usersMapper.selectByPrimaryKey(id);
        Map<String, Object> result = new HashMap<>();
        // judeg if the password is right
        if (bCryptPasswordEncoder.matches(oldPassword, oldpass.getPassword())) {
            // modified the password
            Users user = new Users();
            user.setId(id);
            user.setPassword(bCryptPasswordEncoder.encode(form.getPassword()));

            // 修改密码
            usersMapper.updateByPrimaryKeySelective(user);
            result.put("status", 200);
            result.put("msg", "密码更新成功");
            return result;
        }
        result.put("status", 201);
        result.put("msg", "密码输入错误，请重新尝试！");

        return result;
    }

}
