package com.lzz.util;

/**
 * @author: aichaellee
 * Created by aichaellee on 2018/11/19.
 */

import com.lzz.entity.College;
import org.apache.http.HttpHost;
import org.apache.http.NameValuePair;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class GlobalProxy3 {

    private static CyclicBarrier barrier = new CyclicBarrier(10);

    public static void main(String[] args) throws Exception{

        ExecutorService executor = Executors.newCachedThreadPool();

        for (int i = 0; i < 10; i++) {
            final String threadNum = String.valueOf(i);

            executor.execute(() -> {
                try {
                    authInfo("A学校","123");
                    //authInfo("B学校","123");
//                    authInfo("C学校","张三C"+threadNum);
//                    authInfo("A学校","李四A"+threadNum);
//                    authInfo("B学校","李四B"+threadNum);
//                    authInfo("C学校","李四C"+threadNum);
                } catch (Exception e) {

                }
            });
        }
        Thread.sleep(10000);
        executor.shutdown();

    }

    public static void authInfo(String colleagName,String studentName) throws Exception {


        Optional<College> college = Optional.of(getAllcollegeInfo().get(colleagName));

        if (college.isPresent()) {

            CredentialsProvider credsProvider = new BasicCredentialsProvider();
            credsProvider.setCredentials(
                    new AuthScope(college.get().getVpnHost(), college.get().getVpnPort()),
                    new UsernamePasswordCredentials(college.get().getVpnUserName(), college.get().getVpnPassword()));
            CloseableHttpClient httpclient = HttpClients.custom()
                    .setDefaultCredentialsProvider(credsProvider).build();
            barrier.await();

            try {
                HttpHost proxy = new HttpHost(college.get().getVpnHost(), college.get().getVpnPort());
                RequestConfig config = RequestConfig.custom()
                        .setProxy(proxy)
                        .build();

                String url = String.format(college.get().getAuthHost(),colleagName,studentName);

                HttpGet httpget = new HttpGet(url);
                httpget.setConfig(config);

                // post
                HttpPost httpPost = new HttpPost(url);
                List<NameValuePair> params = new ArrayList<>();
                params.add(new BasicNameValuePair("name","张三"));
                params.add(new BasicNameValuePair("password","123"));
                httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
//                CloseableHttpResponse response = httpclient.execute(httpget);
                CloseableHttpResponse response = httpclient.execute(httpPost);
                try {
                    System.out.println(EntityUtils.toString(response.getEntity()));
                } finally {
                    response.close();
                }
            } finally {
                httpclient.close();
            }
        }

    }

    public static Map<String,College> getAllcollegeInfo(){
        Map<String,College> allInfo = new ConcurrentHashMap<>();
        //get from db
        College collegeA = new College();
        collegeA.setVpnUrl("http://fixie:3EyRwGjnC8O5y5x@velodrome.usefixie.com:80");
        collegeA.setAuthHost("https://testcon-vpn.herokuapp.com/auth");
        allInfo.put("A学校",collegeA);

        College collegeB = new College();
        collegeB.setVpnUrl("http://fixie:FMQQgfNjCAqgYlG@velodrome.usefixie.com:80");
        collegeB.setAuthHost("https://testcon-vpn2.herokuapp.com/vpn?collegeName=%s&stuName=%s");
        allInfo.put("B学校",collegeB);

        College collegeC = new College();
        collegeC.setVpnUrl("http://fixie:hs4js3IznJy2vHv@velodrome.usefixie.com:80");
        collegeC.setAuthHost("https://testcon-vpn3.herokuapp.com/vpn?collegeName=%s&stuName=%s");
        allInfo.put("C学校",collegeC);

        return allInfo;
    }

    }
