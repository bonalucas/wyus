package com.tbabs.service.impl;

import com.tbabs.dao.UserMapper;
import com.tbabs.pojo.User;
import com.tbabs.pojo.UserExample;
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
    public List<User> selectUser(String username) {
        UserExample example = new UserExample();
        example.createCriteria().andUsernameEqualTo(username);
        return userMapper.selectByExample(example);
    }

    @Override
    public Integer updatePicturePath(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public User selectUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}
