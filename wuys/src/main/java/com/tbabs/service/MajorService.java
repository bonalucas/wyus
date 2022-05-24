package com.tbabs.service;

import com.tbabs.pojo.Major;
import com.tbabs.pojo.MajorExample;

import java.util.List;


public interface MajorService {
    // 根据专业编号查询专业信息
    Major selectByMajorId(Integer majorId);
    // 根据条件查询专业信息
    List<Major> selectByExample(MajorExample majorExample);
    // 删除专业信息
    Integer deleteMajor(Integer majorid);
    // 增加专业信息
    Integer addMajor(Major major);
    // 修改专业信息
    Integer updateMajor(Major major);
}
