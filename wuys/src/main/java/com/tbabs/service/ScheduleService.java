package com.tbabs.service;

import com.tbabs.pojo.Course;
import com.tbabs.pojo.Schedule;
import com.tbabs.pojo.ScheduleExample;

import java.util.List;

public interface ScheduleService {
    // 根据学号查找个人选课信息
    List<Course> selectByUserId(Integer userId, String courName);
    // 根据用户id和课程id查找对应的信息
    List<Schedule> selectByUserIdAndCourId(ScheduleExample scheduleExample);
    // 添加选课信息
    Integer saveSchedule(Schedule schedule);
}
