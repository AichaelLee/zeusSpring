package com.lzz.entity.happymall;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@ToString
@Data
@Slf4j
public class User {
    private Integer id;

    private String username;

    private String password;

    private String email;

    private String phone;

    private String question;

    private String answer;

    private Integer role;

    private Date createTime;

    private Date updateTime;

    public User(){}
    public User(Integer id, String username, String password, String email, String phone, String question, String answer, Integer role, Date createTime, Date updateTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.question = question;
        this.answer = answer;
        this.role = role;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
    public User(Integer id, String username, String password,String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    @Override
    public int hashCode(){
        return username.hashCode();
    }

    @Override
    public boolean equals(Object obj){
        if (obj instanceof User){
            return  ((User) obj).getUsername().equals(this.getUsername());
        }
        return false;
    }
    public static void main(String[] args) throws Exception{
        User user = new User(1,"name","q@q.vom","klj");
        User user2 = new User(2,"name","hjklhq@q.vom","klhjkj");
        log.info("is true or fasle {}",user.equals(user2));
        List<User> li = new ArrayList<>();
        li.add(user);
        li.add(user2);
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(li);
        List<User> userList = objectMapper.readValue(s, new
            TypeReference<List<User>>(){});

        for(User suser :userList){
            log.info("suer is {}",suser.toString());

        }
    }
}