package com.finalproject.petkage.review.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.vo.Review;

public interface ReviewService {

	int getReviewAllCount();

	List<Review> getReviewList(PageInfo pageInfo);

	int review_fupload(Review review);

	
}
