package com.finalproject.petkage.notice.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.notice.model.vo.Notice;

public interface NoticeService {

	int getNoticeCount();

	List<Notice> getNoticeList(PageInfo pageInfo);

	int save(Notice notice);

	Notice findNoticeByNo(int no);

	int delete(int no);

}
