package com.tbabs.dao;

import com.tbabs.pojo.User;

public interface UserDao {
    User getUserByNameAndPwd(String name, String pwd);
}
