package com.tbabs.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tbabs.pojo.*;
import com.tbabs.service.*;
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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/reception/user/doLogin")
    public String doLogin(Integer userid, String password, HttpServletRequest request, HttpServletResponse response, @RequestParam("code") String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if ("".equals(String.valueOf(userid)) || "".equals(password)) {
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
            UsernamePasswordToken token = new UsernamePasswordToken(String.valueOf(userid), password);
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
        User user = userService.selectUserById(userid);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        request.getSession().setAttribute("createtime",simpleDateFormat.format(user.getCreationtime()));
        request.getSession().setAttribute("currUser",user);
        Major major = majorService.selectByMajorId(user.getMajorid());
        request.getSession().setAttribute("currMajor", major);
        // 将当前登录时间保存在cookie中
        String lasttime = simpleDateFormat1.format(new Date());
        Cookie currCookie = new Cookie("lasttime", URLEncoder.encode(lasttime, StandardCharsets.UTF_8));
        response.addCookie(currCookie);
        // 获取上次登录的时间
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                if ("lasttime".equals(name)) {
                    lasttime = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                }
            }
        }
        request.getSession().setAttribute("lasttime", lasttime);
        // 获取公告信息
        List<Notice> noticeList = noticeService.selectAllNotice();
        for (Notice notice : noticeList) {
            notice.setFormatTime(simpleDateFormat.format(notice.getTime()));
        }
        request.getSession().setAttribute("noticeList", noticeList);
        // 重定向主页面
        return "redirect:/backstage/success";
    }

    @RequestMapping("/reception/user/doRegister")
    public String doRegister(Integer userid, String username, String password, HttpServletRequest request, @RequestParam("code")String vercode) {
        String certCode = (String) request.getSession().getAttribute("certCode");
        if ("".equals(String.valueOf(userid)) || "".equals(password)) {
            request.setAttribute("errorMessage", "账号或密码为空");
            return "public/register";
        }
        if (!vercode.equals(certCode)) {
            request.setAttribute("errorMessage", "验证码错误");
            return "public/register";
        }
        User user = userService.selectUserById(userid);
        if (user != null) {
            request.setAttribute("errorMessage", "用户名重复");
            return "public/register";
        }
        User newuser = new User();
        newuser.setUserid(userid);
        newuser.setUsername(username);
        newuser.setPassword(password);
        newuser.setCreationtime(new Date());
        newuser.setSex("1");
        newuser.setMajorid(1);
        newuser.setRole(0);
        newuser.setTotalcredits(0);
        newuser.setRemarks("无");
        newuser.setPicture("head.jpg");
        Integer res = userService.saveUser(newuser);
        if (res <= 0) {
            request.setAttribute("errorMessage", "注册失败");
            return "public/register";
        }
        request.setAttribute("msg","注册成功");
        return "public/login";
    }

    @RequestMapping(value = "/reception/user/checkUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkUser(Integer userid){
        User user = userService.selectUserById(userid);

        if (user != null) {
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
        String filePath = request.getServletContext().getRealPath("/imgs/upload");
        String saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(Objects.requireNonNull(file.getOriginalFilename()));
        String uploadImgPath = filePath + File.separator + saveFileName;
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

    @ResponseBody
    @RequestMapping(value = "/backstage/course/showPerCourses", produces="text/html;charset=UTF-8;")
    public String showPerCourses(@RequestParam(value = "page", defaultValue = "1")Integer page, @RequestParam("limit")Integer limit,
                              @RequestParam("courname") String courname, HttpServletRequest request) throws JsonProcessingException {
        // 一页显示10条数据
        PageHelper.startPage(page,limit);

        // 获取当前的用户的学号
        User currUser = (User) request.getSession().getAttribute("currUser");

        List<Course> courseList = scheduleService.selectByUserId(currUser.getUserid(), courname);

        PageInfo<Course> CourseInfo = new PageInfo<>(courseList, 5);

        ObjectMapper mapper = new ObjectMapper();

        // CourseInfo转换为json字符串
        return mapper.writeValueAsString(CourseInfo);
    }

    @ResponseBody
    @RequestMapping("/backstage/course/checkIsSelCourse")
    public String checkIsSelCourse(Integer courid, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("currUser");

        ScheduleExample scheduleExample = new ScheduleExample();
        scheduleExample.createCriteria().andCouridEqualTo(courid).andUseridEqualTo(user.getUserid());

        List<Schedule> scheduleList = scheduleService.selectByUserIdAndCourId(scheduleExample);

        if (scheduleList.size() >= 1) {
            // 表示已经选过该门课程
            return "1";
        }else{
            // 表示未选过该门课程
            return "0";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/schedule/saveSchedule")
    public String saveSchedule(Integer courid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("currUser");

        Schedule schedule = new Schedule();
        schedule.setUserid(user.getUserid());
        schedule.setCourid(courid);
        Integer res = scheduleService.saveSchedule(schedule);

        if (res > 0) {
            // 表示添加成功
            return "1";
        }else{
            // 表示添加失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/schedule/deleteSchedule")
    public String deleteSchedule(Integer courid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("currUser");

        ScheduleExample scheduleExample = new ScheduleExample();
        scheduleExample.createCriteria().andUseridEqualTo(user.getUserid()).andCouridEqualTo(courid);
        Integer res = scheduleService.deleteSchedule(scheduleExample);

        if (res > 0) {
            // 表示删除成功
            return "1";
        }else{
            // 表示删除失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/user/checkPwd")
    public String checkPwd(String password, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("currUser");
        String currPassword = user.getPassword();
        if (currPassword.equals(password)) {
            // 返回1表示当前数据可用
            return "1";
        }else{
            // 返回-1表示当前数据不一致
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/user/updatePwd")
    public String updatePwd(String password, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("currUser");
        if (password != null) {
            user.setPassword(password);
            Integer res = userService.updateUser(user);
            if (res > 0) {
                // 修改成功
                return "1";
            }else{
                // 修改失败
                return "-1";
            }
        }else{
            return "-1";
        }
    }
}
