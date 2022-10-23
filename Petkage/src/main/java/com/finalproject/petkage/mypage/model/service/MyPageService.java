package com.finalproject.petkage.mypage.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.mypage.model.vo.Order;
import com.finalproject.petkage.review.model.vo.Review;

public interface MyPageService {
	
	int getOrderAllCount();

	List<Payment> getOrderList(PageInfo pageInfo, int no);
	
	int getWhReviewAllCount();

	List<Review> getWhReviewList(PageInfo pageInfo, int no);
	
	int getPdReviewAllCount();

	List<Payment> getPdReviewList(PageInfo pageInfo, int no);
	
	int review_fupload(Review review);

}
