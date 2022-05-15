package com.tbabs.service;

import com.tbabs.pojo.User;

import java.util.List;

public interface UserService {
    // 保存用户信息
    Integer saveUser(User user);
    // 查询用户信息
    List<User> selectUser(String username);
}
