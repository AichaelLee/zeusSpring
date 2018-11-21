package com.lzz.controller;

import com.lzz.common.util.SendServerRequest;
import com.lzz.form.PushWooshForm;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@RestController
@Transactional
@RequestMapping(value = "api/v1/user")
public class PushwooshController {

    @Autowired
    private Environment env;

    public static final String PUSHWOOSH_SERVICE_BASE_URL = "https://cp.pushwoosh.com/json/1.3/";

    @PostMapping(value = "/pushwoosh")
    @ResponseStatus(HttpStatus.OK)
    public Map<String, Object> PushWoosh(PushWooshForm content) throws JSONException, MalformedURLException {
        //
        String method = "createMessage";
        URL url = new URL(PUSHWOOSH_SERVICE_BASE_URL + method);

        JSONArray notificationsArray = new JSONArray()
            .put(new JSONObject().put("send_date", "now")
                .put("content", content.getTextarea())
                .put("link", "http://ifw-demo.herokuapp.com"));

        JSONObject requestObject = new JSONObject()
            .put("application", env.getProperty("PUSHWOOSH_APPLICATION_CODE"))
            .put("auth", env.getProperty("PUSHWOOSH_API_TOKEN"))
            //.put("auth",PUSHWOOHS_API_TOKEN)
            .put("notifications", notificationsArray);

        JSONObject mainRequest = new JSONObject().put("request", requestObject);
        JSONObject response = SendServerRequest.sendJSONRequest(url, mainRequest.toString());

        System.out.println("Response is: " + response);
        Map<String, Object> dataMap = new HashMap<>();
        if((Integer)response.get("status_code")==200){
            dataMap.put("status",200);
            dataMap.put("msg","消息发送成功！");
            // dataMap.put("datalist",response);
            return dataMap;
        }
        dataMap.put("status",201);
        dataMap.put("msg"," 消息发送失败！");
        return dataMap;

    }
}
