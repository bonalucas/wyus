package com.tbabs.service.impl;

import com.tbabs.dao.MajorMapper;
import com.tbabs.pojo.Major;
import com.tbabs.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MajorMapperImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;

    @Override
    public Major selectByMajorId(Integer majorId) {
        return majorMapper.selectByPrimaryKey(majorId);
    }
}
