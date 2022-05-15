package com.tbabs.controller;

import com.tbabs.pojo.Major;
import com.tbabs.pojo.User;
import com.tbabs.service.MajorService;
import com.tbabs.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MajorService majorService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "public/login";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "public/register";
    }

    @RequestMapping("/success")
    public String toMain(){
        return "public/main";
    }

    @RequestMapping("/doLogout")
    public String doLogout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/user/toLogin";
    }

    @RequestMapping("/toUD")
    public String toUD(){
        return "error/403";
    }

    @RequestMapping("/doLogin")
    public String doLogin(String username, String password, HttpServletRequest request, @RequestParam("code") String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if ("".equals(username) || "".equals(password)) {
            request.setAttribute("errorMessage", "账号或密码为空");
            return "public/login";
        }
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "public/login";
        }
        Subject subject = SecurityUtils.getSubject();
        // 每次登录操作之前都会进行清空之前登录缓存
        subject.logout();
        if (!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (UnknownAccountException e) {
                request.setAttribute("errorMessage", e.getMessage());
                return "public/login";
            } catch (IncorrectCredentialsException e){
                request.setAttribute("errorMessage", "密码错误");
                return "public/login";
            }
        }
        // session处理信息存储
        List<User> userList = userService.selectUser(username);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        request.getSession().setAttribute("createtime",simpleDateFormat.format(userList.get(0).getCreationtime()));
        request.getSession().setAttribute("currUser",userList.get(0));
        Major major = majorService.selectByMajorId(userList.get(0).getMajorid());
        request.getSession().setAttribute("currMajor", major);
        return "redirect:/user/success";
    }

    @RequestMapping("/doRegister")
    public String doRegister(String username, String password, HttpServletRequest request, @RequestParam("code")String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "public/register";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setCreationtime(new Date());
        user.setSex("0");
        user.setMajorid(1);
        user.setRole(0);
        user.setTotalcredits(0);
        Integer res = userService.saveUser(user);
        if (res <= 0) {
            request.setAttribute("errorMessage", "注册失败");
            return "public/register";
        }
        request.setAttribute("msg","注册成功");
        return "public/login";
    }

    @RequestMapping(value = "/checkUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkUser(String username){
        List<User> userList = userService.selectUser(username);

        if (userList.size() > 0) {
            return "用户名已被占用";
        }else{
            return "当前用户名可用";
        }
    }
}
