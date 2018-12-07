package com.lzz.controller;

import com.lzz.service.RedissonService;
import org.redisson.api.RLock;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.concurrent.TimeUnit;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/7.
 */
@Controller
@RequestMapping("test")
public class testRedisson {




        private static final Logger log = LoggerFactory.getLogger(testRedisson.class);

        @Autowired
        private RedissonService redissonService;

        @RequestMapping(value = "/test")
        @ResponseBody
        public void test(String recordId) {
            System.out.println("redisson service is:"+redissonService);

            RLock lock = redissonService.getRLock(recordId);
            try {
                System.out.println("lock is++++++++:"+lock.getName());
                boolean bs = lock.tryLock(5, 6, TimeUnit.SECONDS);
                if (bs) {
                    // 业务代码
                    log.info("进入业务代码: " + recordId);

                    lock.unlock();
                } else {
                    Thread.sleep(300);
                }
            } catch (Exception e) {
                log.error("", e);
                lock.unlock();
            }
        }

}
