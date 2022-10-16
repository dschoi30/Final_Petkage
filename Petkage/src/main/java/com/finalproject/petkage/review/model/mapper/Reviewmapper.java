package com.finalproject.petkage.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.review.model.vo.Review;

@Mapper
public interface Reviewmapper {

	int getReviewAllCount();

	List<Review> getReviewList(RowBounds rowBounds);

}
