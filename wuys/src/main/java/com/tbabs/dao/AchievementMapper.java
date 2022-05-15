package com.tbabs.dao;

import com.tbabs.pojo.Achievement;
import com.tbabs.pojo.AchievementExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AchievementMapper {
    long countByExample(AchievementExample example);

    int deleteByExample(AchievementExample example);

    int insert(Achievement record);

    int insertSelective(Achievement record);

    List<Achievement> selectByExample(AchievementExample example);

    int updateByExampleSelective(@Param("record") Achievement record, @Param("example") AchievementExample example);

    int updateByExample(@Param("record") Achievement record, @Param("example") AchievementExample example);
}