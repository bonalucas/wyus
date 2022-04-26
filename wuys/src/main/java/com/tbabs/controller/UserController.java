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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
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

    @RequestMapping("/logout")
    public String doLogout(){
        return "redirect:/user/login";
    }

    @RequestMapping("/doLogin")
    public String doLogin(String username, String password, HttpServletRequest request, @RequestParam("code") String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if ("".equals(username) || "".equals(password)) {
            request.setAttribute("errorMessage", "账号或密码为空");
            return "login";
        }
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
        return "redirect:/user/success";
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
        Integer res = userService.saveUser(user);
        if (res <= 0) {
            request.setAttribute("errorMessage", "注册失败");
            return "register";
        }
        request.setAttribute("msg","注册成功");
        return "login";
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
