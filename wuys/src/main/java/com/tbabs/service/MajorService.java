package com.tbabs.service;

import com.tbabs.pojo.Major;


public interface MajorService {
    // 根据专业编号查询专业信息
    Major selectByMajorId(Integer majorId);
}
