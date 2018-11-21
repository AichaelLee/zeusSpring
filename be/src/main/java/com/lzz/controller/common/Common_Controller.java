package com.lzz.controller.common;

import org.json.JSONException;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;

@RestController
@Transactional
@RequestMapping(value = "api/v1/user")
public class Common_Controller {

    /**
     * 天气
     *
     * @param city
     *            city
     * @param response
     *            response
     * @throws IOException
     *             IOException
     */
    @RequestMapping(value = "/getWeather", method = RequestMethod.GET)
    public void getWeather(@RequestParam(name = "city", defaultValue = "130010") String city,
                           HttpServletResponse response) throws IOException {

        String jsonText = readJsonFromUrl("http://weather.livedoor.com/forecast/webservice/json/v1?city=" + city);
        response.setContentType("application/json");
        response.getWriter().write(jsonText);
    }

    private static String readJsonFromUrl(String url) throws IOException, JSONException {
        try (InputStream is = new URL(url).openStream()) {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            return readAll(rd);
        }
    }

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
}
