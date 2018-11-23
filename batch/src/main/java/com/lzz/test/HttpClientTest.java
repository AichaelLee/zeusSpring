package com.lzz.test;

import com.lzz.util.HttpClientResult;
import com.lzz.util.HttpClientUtils;

/**
 * Created by aichaellee on 2018/11/21.
 */
public class HttpClientTest {

    public static void main(String[] args) throws Exception{
        HttpClientResult result = HttpClientUtils.doGet("http://uaap.aufe.edu.cn/cas/login?service=http://127.0.0.1:8080/springmvcdemo/ssoLogin");
    }
}
