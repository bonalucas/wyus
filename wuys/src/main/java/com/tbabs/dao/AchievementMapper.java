package com.tbabs.dao;

import com.tbabs.pojo.Achievement;
import com.tbabs.pojo.AchievementExample;
import com.tbabs.pojo.AchievementKey;
import java.util.List;

import com.tbabs.pojo.ScoreInfo;
import org.apache.ibatis.annotations.Param;

public interface AchievementMapper {
    long countByExample(AchievementExample example);

    int deleteByExample(AchievementExample example);

    int deleteByPrimaryKey(AchievementKey key);

    int insert(Achievement record);

    int insertSelective(Achievement record);

    List<Achievement> selectByExample(AchievementExample example);

    Achievement selectByPrimaryKey(AchievementKey key);

    int updateByExampleSelective(@Param("record") Achievement record, @Param("example") AchievementExample example);

    int updateByExample(@Param("record") Achievement record, @Param("example") AchievementExample example);

    int updateByPrimaryKeySelective(Achievement record);

    int updateByPrimaryKey(Achievement record);

    // 根据学号获取成绩信息
    List<ScoreInfo> selectByUserId(@Param("userid") Integer userid, @Param("courname")String courname);
}