package com.finalproject.petkage.mypage.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.PayItems;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.mypage.model.vo.Calendar;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Heart;

@Mapper
public interface MyPageMapper {
	
	int getOrderAllCount();

	List<Payment> getOrderList(RowBounds rowBounds, int no);
	
	int getWhReviewAllCount();

	List<Review> getWhReviewList(RowBounds rowBounds, int no);
	
	List<Heart> getHeartList(RowBounds rowBounds, int no);
	
	int getPdReviewAllCount();
	
	int getHeartAllCount();
	
	Product selectRwProductByNo(@Param("proNo") int proNo);

	PayItems selectPayItemsByNo(@Param("payItemNo") int payItemNo);
	
	List<Payment> getPdReviewList(RowBounds rowBounds, int no);

	int pdreview_fupload(Review review);
	
	PayItems getPayNoName(int payItemNo);

    List<Calendar> getListFestivalCalendar();

}
