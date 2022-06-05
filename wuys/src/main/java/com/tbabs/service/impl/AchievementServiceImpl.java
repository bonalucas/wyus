package com.tbabs.service.impl;

import com.tbabs.dao.AchievementMapper;
import com.tbabs.pojo.ScoreInfo;
import com.tbabs.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AchievementServiceImpl implements AchievementService {
    @Autowired
    private AchievementMapper achievementMapper;

    @Override
    public List<ScoreInfo> selectByUserId(Integer userid, String courname) {
        return achievementMapper.selectByUserId(userid, courname);
    }
}
