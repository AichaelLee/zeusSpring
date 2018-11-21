package com.lzz.common.util;
import org.json.*;

import java.net.*;
public class SendPushNotification {
    public static final String PUSHWOOSH_SERVICE_BASE_URL = "https://cp.pushwoosh.com/json/1.3/";
    private static final String APPLICATION_CODE = "E879F-2B49F";
    //temp
    private static final String PUSHWOOHS_API_TOKEN = "pbJHcx1voc4ykH3904fcatgsAzYhsPL1iYFCEXh4C4GWp07T9dJOvCHlJyQ9zrCwG6SZWz0i3GklL6lRa6u9";

    public static void main(String[] args) throws JSONException, MalformedURLException
    {
        String method = "createMessage";
        URL url = new URL(PUSHWOOSH_SERVICE_BASE_URL + method);

        JSONArray notificationsArray = new JSONArray()
            .put(new JSONObject().put("send_date", "now")
                .put("content", "test")
                .put("link", "http://pushwoosh.com/"));

        JSONObject requestObject = new JSONObject()
            .put("application", APPLICATION_CODE)
            //.put("auth", System.getenv("PUSHWOOHS_API_TOKEN"))
            .put("auth",PUSHWOOHS_API_TOKEN)
            .put("notifications", notificationsArray);

        JSONObject mainRequest = new JSONObject().put("request", requestObject);
        JSONObject response = SendServerRequest.sendJSONRequest(url, mainRequest.toString());

        System.out.println("Response is: " + response);
    }

}
