package com.tbabs.service.impl;

import com.tbabs.dao.ScheduleMapper;
import com.tbabs.pojo.Course;
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
}
