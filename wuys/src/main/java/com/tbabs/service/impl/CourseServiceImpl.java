package com.tbabs.service.impl;

import com.tbabs.dao.CourseMapper;
import com.tbabs.pojo.Course;
import com.tbabs.pojo.CourseExample;
import com.tbabs.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> selectCourses(CourseExample courseExample) {
        return courseMapper.selectByExample(courseExample);
    }
}
