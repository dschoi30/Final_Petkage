package com.finalproject.petkage.notice.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {
	int selectNoticeCount();

	List<Notice> selectAll(RowBounds rowBounds);

	Notice selectNoticeByNo(@Param("no") int no);

	int insertNotice(Notice notice);

	int updateNotice(Notice notice);

	int updateStatus(@Param("no") int no, @Param("status") String string);
}
