package com.tbabs.service;

import com.tbabs.pojo.Notice;

import java.util.List;

public interface NoticeService {
    // 查询所有公告内容
    List<Notice> selectAllNotice();
    // 增加公告信息
    Integer saveNotice(Notice notice);
    // 修改公告信息
    Integer updateNotice(Notice notice);
    // 删除公告信息
    Integer deleteNotice(Integer noticeid);
}
