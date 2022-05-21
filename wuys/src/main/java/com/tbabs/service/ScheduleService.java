package com.tbabs.service;

import com.tbabs.pojo.Course;

import java.util.List;

public interface ScheduleService {
    // 根据学号查找个人选课信息
    List<Course> selectByUserId(Integer userId, String courName);
}
