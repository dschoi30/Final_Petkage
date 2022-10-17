package com.finalproject.petkage.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.mapper.Reviewmapper;
import com.finalproject.petkage.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private Reviewmapper reviewmapper;
	
	@Override
	public int getReviewAllCount() {
		
		return reviewmapper.getReviewAllCount();
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList(rowBounds);
	}

	@Override
	@Transactional
	public int review_fupload(Review review) {

		int result = 0;
		result = reviewmapper.review_fupload(review);
		
		return result;
	}

}
