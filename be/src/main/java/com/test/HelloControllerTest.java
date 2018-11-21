package com.test;

import com.App;
import com.lzz.common.ApplicationContextHolder;
import com.lzz.dao.UserJpaDao;
import com.lzz.entity.Users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by aichaellee on 2018/9/30.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = App.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class HelloControllerTest {
    @Autowired
    UserJpaDao userJpaDao;

    @Autowired
    ApplicationContextHolder applicationContextHolder;

    @Test
    public void test(){
        Users result = userJpaDao.findByName("testtest");
        System.out.println("user is "+result.toString());
        System.out.println("******appliationContext is"+applicationContextHolder.getApplicationContext().toString());
    }
}
