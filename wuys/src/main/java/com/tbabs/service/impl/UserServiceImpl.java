package com.tbabs.service.impl;

import com.tbabs.dao.UserMapper;
import com.tbabs.pojo.HotMajor;
import com.tbabs.pojo.HotTrend;
import com.tbabs.pojo.SexInfo;
import com.tbabs.pojo.User;
import com.tbabs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer saveUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public Integer updatePicturePath(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public User selectUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public List<SexInfo> selectBySex() {
        return userMapper.selectBySex();
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<HotMajor> selectByHot() {
        return userMapper.selectByHot();
    }

    @Override
    public List<HotTrend> selectByTrend(Integer majorid) {
        return userMapper.selectByTrend(majorid);
    }
}
