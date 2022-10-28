package com.finalproject.petkage.mypage.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.PayItems;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.mypage.model.vo.Calendar;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Heart;

public interface MyPageService {
	
	int getOrderAllCount();

	List<Payment> getOrderList(PageInfo pageInfo, int no);
	
	int getWhReviewAllCount();

	List<Review> getWhReviewList(PageInfo pageInfo, int no);
	
	List<Heart> getHeartList(PageInfo pageInfo, int no);	
	
	int getHeartAllCount();
	
	int getPdReviewAllCount();
	
	Product findRwProductByNo(int proNo);
	
	PayItems findPayItemsByNo(int payItemNo);
	
	List<Payment> getPdReviewList(PageInfo pageInfo, int no);
	
	int pdreview_fupload(Review review);
	
	PayItems getPayNoName(int payItemNo);

    List<Calendar> getListFestivalCalendar();
	

}
