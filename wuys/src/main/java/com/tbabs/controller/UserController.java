package com.tbabs.controller;

import com.tbabs.pojo.User;
import com.tbabs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

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

    @RequestMapping(value = "/insertUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String insertUser(Integer id, String name, String sex, Integer age) {
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setSex(sex);
        user.setAge(age);
        user.setBirthday(new Date());
        Integer row = userService.insertUser(user);
        System.out.println("添加是否成功：" + (row == 1 ? "成功" : "失败"));
        return "添加是否成功：" + (row == 1 ? "成功" : "失败");
    }

    @RequestMapping(value = "/deleteUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteUser(Integer id) {
        Integer row = userService.deleteUser(id);
        System.out.println("删除是否成功：" + (row == 1 ? "成功" : "失败"));
        return "删除是否成功：" + (row == 1 ? "成功" : "失败");
    }

    @RequestMapping(value = "/updateUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updateUser(Integer id, String name, String sex, Integer age) {
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setSex(sex);
        user.setAge(age);
        user.setBirthday(new Date());
        Integer row = userService.updateUser(user);
        System.out.println("修改是否成功：" + (row == 1 ? "成功" : "失败"));
        return "修改是否成功：" + (row == 1 ? "成功" : "失败");
    }
}
