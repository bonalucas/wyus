package com.tbabs.service.impl;

import com.tbabs.dao.MajorMapper;
import com.tbabs.pojo.Major;
import com.tbabs.pojo.MajorExample;
import com.tbabs.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorMapperImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;

    @Override
    public Major selectByMajorId(Integer majorId) {
        return majorMapper.selectByPrimaryKey(majorId);
    }

    @Override
    public List<Major> selectByExample(MajorExample majorExample) {
        return majorMapper.selectByExample(majorExample);
    }

    @Override
    public Integer deleteMajor(Integer majorid) {
        return majorMapper.deleteByPrimaryKey(majorid);
    }

    @Override
    public Integer addMajor(Major major) {
        return majorMapper.insert(major);
    }

    @Override
    public Integer updateMajor(Major major) {
        return majorMapper.updateByPrimaryKey(major);
    }
}
