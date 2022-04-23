package com.tbabs.dao;


import com.tbabs.pojo.User;

public interface UserDao {
    User selectById(Integer id);
}
