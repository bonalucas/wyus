package com.tbabs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("/login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/go")
    public String toMain(){
        return "main";
    }

    @RequestMapping("/bingtu")
    public String iframe() {
        return "iframe/bingtu";
    }

    @RequestMapping("/carousel")
    public String iframe1() {
        return "iframe/carousel";
    }
    @RequestMapping("/zhexian")
    public String iframe2() {
        return "iframe/zhexian";
    }

    @RequestMapping("/zhuzhuang")
    public String iframe3() {
        return "iframe/zhuzhuang";
    }

    @RequestMapping("/jianjie")
    public String iframe4() {
        return "iframe/jianjie";
    }

    @RequestMapping("/perinf")
    public String toPerinf() {
        return "perinf";
    }

    @RequestMapping("/proman")
    public String toProman() {
        return "proman";
    }

    @RequestMapping("/coursel")
    public String toCoursel() {
        return "coursel";
    }

    @RequestMapping("/courman")
    public String toCourman() {
        return "courman";
    }

    @RequestMapping("/stuman")
    public String toStuman() {
        return "stuman";
    }

    @RequestMapping("/upkwd")
    public String toUpkwd() {
        return "upkwd";
    }

    @RequestMapping("/courses")
    public String toCourses() {
        return "courses";
    }
}
