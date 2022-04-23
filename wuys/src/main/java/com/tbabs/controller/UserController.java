package com.tbabs.controller;

import com.tbabs.pojo.User;
import com.tbabs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/main")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/go")
    public String toMain(){
        return "main";
    }

    @RequestMapping(value = "/getUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getUser(Integer id, HttpServletResponse response) {
        User user = userService.selectById(id);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String birthday = simpleDateFormat.format(user.getBirthday());
        String res = "User{id = " + user.getId()+", name=" + user.getName() + ", sex=" + user.getSex() + ", age=" + user.getAge() + ", birthday="+ birthday +  "}";
        System.out.println(res);
        return res;
    }
}
