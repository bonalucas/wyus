package com.tbabs.service;

import com.tbabs.pojo.User;
import com.tbabs.pojo.UserExample;

public interface UserService {
    User selectById(Integer id);

    Integer insertUser(User user);

    Integer deleteUser(Integer id);

    Integer updateUser(User user);
}
