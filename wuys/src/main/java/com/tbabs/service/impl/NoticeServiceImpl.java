package com.tbabs.service.impl;

import com.tbabs.dao.NoticeMapper;
import com.tbabs.pojo.Notice;
import com.tbabs.pojo.NoticeExample;
import com.tbabs.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectAllNotice() {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.or();
        return noticeMapper.selectByExample(noticeExample);
    }

    @Override
    public Integer saveNotice(Notice notice) {
        return noticeMapper.insert(notice);
    }

    @Override
    public Integer updateNotice(Notice notice) {
        return noticeMapper.updateByPrimaryKey(notice);
    }

    @Override
    public Integer deleteNotice(Integer noticeid) {
        return noticeMapper.deleteByPrimaryKey(noticeid);
    }
}
