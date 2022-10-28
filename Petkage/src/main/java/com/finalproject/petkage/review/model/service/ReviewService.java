package com.finalproject.petkage.review.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.vo.Review;

public interface ReviewService {

	int getReviewAllCount();

	List<Review> getReviewList(PageInfo pageInfo);

	int review_fupload(Review review);

	int search_list(String search);

	List<Review> search_board(PageInfo pageInfo, String search);

	int getReviewAllCount_cafe();

	List<Review> getReviewList_cafe(PageInfo pageInfo);

	int getReviewAllCount_food();

	List<Review> getReviewList_food(PageInfo pageInfo);

	int getReviewAllCount_hair();

	List<Review> getReviewList_hair(PageInfo pageInfo);

	int getReviewAllCount_trip();

	List<Review> getReviewList_trip(PageInfo pageInfo);

	int getReviewAllCount_hospital();

	List<Review> getReviewList_hospital(PageInfo pageInfo);

	int getReviewAllCount_preschool();

	List<Review> getReviewList_preschool(PageInfo pageInfo);

	int getReviewAllCount_bath();

	List<Review> getReviewList_bath(PageInfo pageInfo);

	int getReviewAllCount_review_all();

	List<Review> getReviewList_review_all(PageInfo pageInfo);

	int getReviewAllCount_review_lodging();

	List<Review> getReviewList_review_lodging(PageInfo pageInfo);

	List<Review> findReviewByName_lodging(String spotName);
	
}
