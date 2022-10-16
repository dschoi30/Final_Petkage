package com.finalproject.petkage.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public Notice findNoticeByNo(int no) {
		
		return mapper.selectNoticeByNo(no);
	}

	@Override
	@Transactional
	public int save(Notice notice) {
		int result = 0;
		
		if(notice.getNo() != 0) {
			// update
			result = mapper.updateNotice(notice);
		} else {
			// insert
			result = mapper.insertNotice(notice);
		}

		return result;
	}

	@Override
	@Transactional
	public int delete(int no) {
		int result = 0;
		
		result = mapper.updateStatus(no, "N");

		return result;
	}


}
