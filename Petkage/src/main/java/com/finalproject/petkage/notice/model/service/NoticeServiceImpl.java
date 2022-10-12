package com.finalproject.petkage.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.notice.model.mapper.NoticeMapper;
import com.finalproject.petkage.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public int getNoticeCount() {
		
		return mapper.selectNoticeCount();
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAll(rowBounds);
	}

}
