package com.tbabs.service;

import com.tbabs.pojo.SexInfo;
import com.tbabs.pojo.User;
import com.tbabs.pojo.UserExample;

import java.util.List;

public interface UserService {
    // 保存用户信息
    Integer saveUser(User user);
    // 根据用户编号查询用户信息
    User selectUserById(Integer userId);
    // 修改图片路径
    Integer updatePicturePath(User user);
    // 根据跳转查询用户信息
    List<User> selectByUsername(String username);
    // 查询性别比例
    List<SexInfo> selectBySex();
    // 修改学生信息
    Integer updateUser(User user);
}
