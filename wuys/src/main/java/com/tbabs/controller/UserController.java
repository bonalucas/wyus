package com.tbabs.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tbabs.pojo.Course;
import com.tbabs.pojo.CourseExample;
import com.tbabs.pojo.Major;
import com.tbabs.pojo.User;
import com.tbabs.service.CourseService;
import com.tbabs.service.MajorService;
import com.tbabs.service.UserService;
import com.tbabs.utils.FileNameUtil;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/reception/user/doLogin")
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
        return "redirect:/backstage/success";
    }

    @RequestMapping("/reception/user/doRegister")
    public String doRegister(String username, String password, HttpServletRequest request, @RequestParam("code")String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if ("".equals(username) || "".equals(password)) {
            request.setAttribute("errorMessage", "账号或密码为空");
            return "public/register";
        }
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "public/register";
        }
        List<User> userList = userService.selectUser(username);
        if (userList.size() > 0) {
            request.setAttribute("errorMessage", "用户名重复");
            return "public/register";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setCreationtime(new Date());
        user.setSex("1");
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

    @RequestMapping(value = "/reception/user/checkUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkUser(String username){
        List<User> userList = userService.selectUser(username);

        if (userList.size() > 0) {
            return "用户名已被占用";
        }else{
            return "当前用户名可用";
        }
    }

    @RequestMapping("/backstage/user/upload")
    @ResponseBody
    public Map<String, Object> upload(MultipartFile file, HttpServletRequest request) throws IOException {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> data = new HashMap<>();
        String filePath = "C:\\Users\\30141\\IdeaProjects\\hw\\wuys\\src\\main\\webapp\\imgs\\upload\\";
        String saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(Objects.requireNonNull(file.getOriginalFilename()));
        String uploadImgPath = filePath + saveFileName;
        // 修改数据库中的图片路径
        User user = (User) request.getSession().getAttribute("currUser");
        user.setPicture("upload/" + saveFileName);
        Integer res = userService.updatePicturePath(user);
        if (res < 0) {
            throw new RuntimeException("数据库图片更新失败");
        }
        file.transferTo(new File(uploadImgPath));
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", data);
        String basePath = request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + request.getContextPath() +"/";
        data.put("src", basePath + "imgs/upload/" + saveFileName);
        return map;
    }

    @RequestMapping("/backstage/user/updateSession")
    public String updateSession(Integer userId, HttpServletRequest request){
        User user = userService.selectUserById(userId);
        request.getSession().removeAttribute("currUser");
        request.getSession().setAttribute("currUser", user);
        return "redirect:/backstage/success";
    }

    @ResponseBody
    @RequestMapping(value = "/backstage/course/showCourses", produces="text/html;charset=UTF-8;")
    public String showCourses(@RequestParam(value = "page", defaultValue = "1")Integer page, @RequestParam("limit")Integer limit,
                              @RequestParam("courname") String courname) throws JsonProcessingException {
        CourseExample courseExample = new CourseExample();
        courseExample.createCriteria().andCournameLike("%" + courname + "%");

        // 一页显示10条数据
        PageHelper.startPage(page,limit);

        List<Course> courseList = courseService.selectCourses(courseExample);

        PageInfo<Course> CourseInfo = new PageInfo<>(courseList, 5);

        ObjectMapper mapper = new ObjectMapper();

        // CourseInfo转换为json字符串
        return mapper.writeValueAsString(CourseInfo);
    }
}
