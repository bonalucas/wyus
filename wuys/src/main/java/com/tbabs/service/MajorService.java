package com.tbabs.service;

import com.tbabs.pojo.Major;
import com.tbabs.pojo.MajorExample;

import java.util.List;


public interface MajorService {
    // 根据专业编号查询专业信息
    Major selectByMajorId(Integer majorId);
    // 根据条件查询专业信息
    List<Major> selectByExample(MajorExample majorExample);
}
