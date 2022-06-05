package com.tbabs.service;

import com.tbabs.pojo.ScoreInfo;

import java.util.List;

public interface AchievementService {
    // 根据学号查询成绩信息
    List<ScoreInfo> selectByUserId(Integer userid, String courname);
}
