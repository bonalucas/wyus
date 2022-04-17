package com.tbabs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/main")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/go")
    public String toMain(){
        return "main";
    }
}
