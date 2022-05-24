package com.tbabs.service;

import com.tbabs.pojo.Course;
import com.tbabs.pojo.CourseExample;

import java.util.List;

public interface CourseService {
    // 分页查询课程信息
    List<Course> selectCourses(CourseExample courseExample);
    // 删除课程信息
    Integer deleteCourse(Integer courid);
    // 增加课程信息
    Integer addCourse(Course course);
    // 修改课程
    Integer updateCourse(Course course);
}
