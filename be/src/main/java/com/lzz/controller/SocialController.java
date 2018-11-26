package com.lzz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by aichaellee on 2018/11/26.
 */
@Controller
@RequestMapping(value = "api/v1/user")
public class SocialController {

    public static String redrictUrl = "";
    @GetMapping(value="gitlogin")
    public void authLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect(redrictUrl);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
