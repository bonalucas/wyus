package com.tbabs.service;

import com.tbabs.pojo.User;

import java.util.List;

public interface UserService {
    Integer saveUser(User user);

    List<User> selectUser(String username);
}
