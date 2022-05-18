package com.tbabs.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tbabs.pojo.*;
import com.tbabs.service.CourseService;
import com.tbabs.service.MajorService;
import com.tbabs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ManagerController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/backstage/man/showManCourses", produces="text/html;charset=UTF-8;")
    public String showManCourses(@RequestParam(value = "page", defaultValue = "1")Integer page, @RequestParam("limit")Integer limit,
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
    @RequestMapping(value = "/backstage/man/showManMajor", produces="text/html;charset=UTF-8;")
    public String showManMajor(@RequestParam(value = "page", defaultValue = "1")Integer page, @RequestParam("limit")Integer limit,
                               @RequestParam("majorname") String majorname) throws JsonProcessingException {
        MajorExample majorExample = new MajorExample();
        majorExample.createCriteria().andMajornameLike("%" + majorname + "%");

        // 一页显示10条数据
        PageHelper.startPage(page,limit);

        List<Major> majorsList = majorService.selectByExample(majorExample);

        PageInfo<Major> MajorsInfo = new PageInfo<>(majorsList, 5);

        ObjectMapper mapper = new ObjectMapper();

        // CourseInfo转换为json字符串
        return mapper.writeValueAsString(MajorsInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/backstage/man/showManStudent", produces="text/html;charset=UTF-8;")
    public String showManStudent(@RequestParam(value = "page", defaultValue = "1")Integer page, @RequestParam("limit")Integer limit,
                               @RequestParam("username") String username) throws JsonProcessingException {
        // 一页显示10条数据
        PageHelper.startPage(page,limit);

        List<User> userList = userService.selectByUsername(username);

        PageInfo<User> userInfo = new PageInfo<>(userList, 5);

        ObjectMapper mapper = new ObjectMapper();

        // CourseInfo转换为json字符串
        return mapper.writeValueAsString(userInfo);
    }
}
