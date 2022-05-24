package com.tbabs.controller;

import com.tbabs.pojo.Major;
import com.tbabs.pojo.MajorExample;
import com.tbabs.pojo.SexInfo;
import com.tbabs.service.MajorService;
import com.tbabs.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TransferController {

    @Autowired
    private UserService userService;
    @Autowired
    private MajorService majorService;

    @RequestMapping("/reception/toLogin")
    public String toLogin(){
        return "public/login";
    }

    @RequestMapping("/reception/toRegister")
    public String toRegister() {
        return "public/register";
    }

    @RequestMapping("/reception/toUD")
    public String toUD(){
        return "error/403";
    }

    @RequestMapping("/backstage/doLogout")
    public String doLogout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/reception/toLogin";
    }

    @RequestMapping("/backstage/success")
    public String toMain(){
        return "public/main";
    }

    @RequestMapping("/backstage/toPG")
    public String toPG(HttpServletRequest request) {
        List<SexInfo> sexInfoList = userService.selectBySex();
        request.setAttribute("sexInfoList",sexInfoList);
        return "iframe/pieGraph";
    }

    @RequestMapping("/backstage/toCL")
    public String toCL() {
        return "iframe/carousel";
    }

    @RequestMapping("/backstage/toSG")
    public String toSG() {
        return "iframe/snapGraph";
    }

    @RequestMapping("/backstage/toCG")
    public String toCG() {
        return "iframe/columnarGraph";
    }

    @RequestMapping("/backstage/toSP")
    public String toSP() {
        return "iframe/synopsis";
    }

    @RequestMapping("/backstage/toPerinf")
    public String toPerinf() {
        return "user/perinf";
    }

    @RequestMapping("/backstage/toCoursel")
    public String toCoursel() {
        return "user/coursel";
    }

    @RequestMapping("/backstage/toUpkwd")
    public String toUpkwd() {
        return "user/upkwd";
    }

    @RequestMapping("/backstage/toCourses")
    public String toCourses() {
        return "user/courses";
    }

    @RequestMapping("/backstage/man/toProman")
    public String toProman() {
        return "admin/proman";
    }

    @RequestMapping("/backstage/man/toCourman")
    public String toCourman() {
        return "admin/courman";
    }

    @RequestMapping("/backstage/man/toStuman")
    public String toStuman(HttpServletRequest request) {
        MajorExample majorExample = new MajorExample();
        majorExample.or();
        List<Major> majorList = majorService.selectByExample(majorExample);
        request.setAttribute("majorList", majorList);
        return "admin/stuman";
    }
}
