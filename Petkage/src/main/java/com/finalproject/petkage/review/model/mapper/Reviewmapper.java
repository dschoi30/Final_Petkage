package com.finalproject.petkage.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.review.model.vo.Review;

@Mapper
public interface Reviewmapper {

	int getReviewAllCount();

	List<Review> getReviewList(RowBounds rowBounds);

	int review_fupload(Review review);

	int review_search(String search);

	List<Review> search_mboard(RowBounds rowBounds, String search);

	int getReviewAllCount_cafe();

	List<Review> getReviewList_cafe(RowBounds rowBounds);

	int getReviewAllCount_food();

	List<Review> getReviewList_food(RowBounds rowBounds);

	int getReviewAllCount_hair();

	List<Review> getReviewList_hair(RowBounds rowBounds);

	int getReviewAllCount_trip();

	List<Review> getReviewList_trip(RowBounds rowBounds);

	int getReviewAllCount_hospital();

	List<Review> getReviewList_hospital(RowBounds rowBounds);

	int getReviewAllCount_preschool();

	List<Review> getReviewList_preschool(RowBounds rowBounds);

	int getReviewAllCount_bath();

	List<Review> getReviewList_bath(RowBounds rowBounds);

	int getReviewAllCount_review_all();

	List<Review> getReviewList_review_all(RowBounds rowBounds);

	int getReviewAllCount_review_lodging();

	List<Review> getReviewList_review_lodging(RowBounds rowBounds);

	List<Review> findReviewByName_lodging(String spotName);

}
