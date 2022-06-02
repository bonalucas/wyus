package com.tbabs.service.impl;

import com.tbabs.dao.ScheduleMapper;
import com.tbabs.pojo.Course;
import com.tbabs.pojo.HotCourse;
import com.tbabs.pojo.Schedule;
import com.tbabs.pojo.ScheduleExample;
import com.tbabs.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public List<Course> selectByUserId(Integer userId, String courName) {
        return scheduleMapper.selectByUserId(userId, courName);
    }

    @Override
    public List<Schedule> selectByUserIdAndCourId(ScheduleExample scheduleExample) {
        return scheduleMapper.selectByExample(scheduleExample);
    }

    @Override
    public Integer saveSchedule(Schedule schedule) {
        return scheduleMapper.insertSelective(schedule);
    }

    @Override
    public Integer deleteSchedule(ScheduleExample scheduleExample) {
        return scheduleMapper.deleteByExample(scheduleExample);
    }

    @Override
    public List<HotCourse> selectByHotCourse() {
        return scheduleMapper.selectByHotCourse();
    }
}
