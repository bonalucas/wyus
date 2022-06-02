package com.tbabs.dao;

import com.tbabs.pojo.Course;
import com.tbabs.pojo.HotCourse;
import com.tbabs.pojo.Schedule;
import com.tbabs.pojo.ScheduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ScheduleMapper {
    long countByExample(ScheduleExample example);

    int deleteByExample(ScheduleExample example);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    List<Schedule> selectByExample(ScheduleExample example);

    int updateByExampleSelective(@Param("record") Schedule record, @Param("example") ScheduleExample example);

    int updateByExample(@Param("record") Schedule record, @Param("example") ScheduleExample example);

    List<Course> selectByUserId(@Param("userId") Integer userId, @Param("courName")String courName);

    List<HotCourse> selectByHotCourse();
}