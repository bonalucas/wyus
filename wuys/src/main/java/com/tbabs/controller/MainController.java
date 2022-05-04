package com.tbabs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("/toPG")
    public String toPG() {
        return "iframe/pieGraph";
    }

    @RequestMapping("/toCL")
    public String toCL() {
        return "iframe/carousel";
    }
    @RequestMapping("/toSG")
    public String toSG() {
        return "iframe/snapGraph";
    }

    @RequestMapping("/toCG")
    public String toCG() {
        return "iframe/columnarGraph";
    }

    @RequestMapping("/toSP")
    public String toSP() {
        return "iframe/synopsis";
    }

    @RequestMapping("/toPerinf")
    public String toPerinf() {
        return "user/perinf";
    }

    @RequestMapping("/toProman")
    public String toProman() {
        return "admin/proman";
    }

    @RequestMapping("/toCoursel")
    public String toCoursel() {
        return "user/coursel";
    }

    @RequestMapping("/toCourman")
    public String toCourman() {
        return "admin/courman";
    }

    @RequestMapping("/toStuman")
    public String toStuman() {
        return "admin/stuman";
    }

    @RequestMapping("/toUpkwd")
    public String toUpkwd() {
        return "user/upkwd";
    }

    @RequestMapping("/toCourses")
    public String toCourses() {
        return "user/courses";
    }
}
