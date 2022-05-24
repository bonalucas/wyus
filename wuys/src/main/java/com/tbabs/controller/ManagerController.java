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

import javax.servlet.http.HttpServletRequest;
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
                                 @RequestParam("username") String username, HttpServletRequest request) throws JsonProcessingException {
        // 一页显示10条数据
        PageHelper.startPage(page,limit);

        List<User> userList = userService.selectByUsername(username);

        PageInfo<User> userInfo = new PageInfo<>(userList, 5);

        ObjectMapper mapper = new ObjectMapper();

        // CourseInfo转换为json字符串
        return mapper.writeValueAsString(userInfo);
    }

    @ResponseBody
    @RequestMapping("/backstage/man/deleteCourse")
    public String deleteCourse(Integer courid) {
        Integer res = courseService.deleteCourse(courid);
        if (res > 0) {
            // 表示删除成功
            return "1";
        }else{
            // 表示删除失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/addCourse")
    public String addCourse(String courname, String semester, Integer period, Integer credit) {
        Course course = new Course();
        course.setCourname(courname);
        course.setSemester(semester);
        course.setPeriod(period);
        course.setCredit(credit);

        Integer res = courseService.addCourse(course);
        if (res > 0) {
            // 表示添加成功
            return "1";
        }else{
            // 表示添加失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/updateCourse")
    public String updateCourse(Integer courid, String courname, String semester, Integer period, Integer credit) {
        Course course = new Course();
        course.setCourid(courid);
        course.setCourname(courname);
        course.setSemester(semester);
        course.setPeriod(period);
        course.setCredit(credit);

        Integer res = courseService.updateCourse(course);
        if (res > 0) {
            // 表示修改成功
            return "1";
        }else{
            // 表示修改失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/deleteMajor")
    public String deleteMajor(Integer majorid) {
        Integer res = majorService.deleteMajor(majorid);
        if (res > 0) {
            // 表示删除成功
            return "1";
        }else{
            // 表示删除失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/addMajor")
    public String addMajor(String majorname, Integer amount, String assistant) {
        Major major = new Major();
        major.setMajorname(majorname);
        major.setAmount(amount);
        major.setAssistant(assistant);

        Integer res = majorService.addMajor(major);
        if (res > 0) {
            // 表示添加成功
            return "1";
        }else{
            // 表示添加失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/updateMajor")
    public String updateMajor(Integer majorid, String majorname, Integer amount, String assistant) {
        Major major = new Major();
        major.setMajorid(majorid);
        major.setMajorname(majorname);
        major.setAmount(amount);
        major.setAssistant(assistant);

        Integer res = majorService.updateMajor(major);
        if (res > 0) {
            // 表示修改成功
            return "1";
        }else{
            // 表示修改失败
            return "-1";
        }
    }

    @ResponseBody
    @RequestMapping("/backstage/man/updateUser")
    public String updateUser(Integer userid, String sex, Integer majorid,Integer totalcredits) {
        User user = userService.selectUserById(userid);
        user.setSex(sex);
        user.setMajorid(majorid);
        user.setTotalcredits(totalcredits);

        Integer res = userService.updateUser(user);
        if (res > 0) {
            // 表示修改成功
            return "1";
        }else{
            // 表示修改失败
            return "-1";
        }
    }
}
