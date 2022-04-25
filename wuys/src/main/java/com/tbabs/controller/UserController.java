package com.tbabs.controller;

import com.tbabs.pojo.User;
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

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/register")
    public String toRegister() {
        return "register";
    }

    @RequestMapping("/success")
    public String toMain(){
        return "main";
    }

    @RequestMapping("/doLogin")
    public String doLogin(String username, String password, HttpServletRequest request, @RequestParam("code") String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "login";
        }
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        if (!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (UnknownAccountException e) {
                request.setAttribute("errorMessage", e.getMessage());
                return "login";
            } catch (IncorrectCredentialsException e){
                request.setAttribute("errorMessage", "密码错误");
                return "login";
            }
        }
        return "redirect:/success";
    }

    @RequestMapping("/doRegister")
    public String doRegister(String username, String password, HttpServletRequest request, @RequestParam("code")String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "register";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        userService.saveUser(user);
        return "login";
    }
}
