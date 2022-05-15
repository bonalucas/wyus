package com.tbabs.service;

import com.tbabs.pojo.Course;
import com.tbabs.pojo.CourseExample;

import java.util.List;

public interface CourseService {
    //分页查询课程信息
    List<Course> selectCourses(CourseExample courseExample);
}
