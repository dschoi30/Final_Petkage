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
	public int getReviewAllCount_review_all() {
		
		return reviewmapper.getReviewAllCount_review_all();
	}

	@Override
	public List<Review> getReviewList_review_all(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_review_all(rowBounds);
	}
	
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
	public int getReviewAllCount_cafe() {
		
		return reviewmapper.getReviewAllCount_cafe();
	}

	@Override
	public List<Review> getReviewList_cafe(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_cafe(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_food() {
		
		return reviewmapper.getReviewAllCount_food();
	}

	@Override
	public List<Review> getReviewList_food(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_food(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_hair() {
		
		return reviewmapper.getReviewAllCount_hair();
	}

	@Override
	public List<Review> getReviewList_hair(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_hair(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_trip() {
		
		return reviewmapper.getReviewAllCount_trip();
	}

	@Override
	public List<Review> getReviewList_trip(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_trip(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_hospital() {
		
		return reviewmapper.getReviewAllCount_hospital();
	}

	@Override
	public List<Review> getReviewList_hospital(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_hospital(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_preschool() {
		
		return reviewmapper.getReviewAllCount_preschool();
	}

	@Override
	public List<Review> getReviewList_preschool(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_preschool(rowBounds);
	}
	
	@Override
	public int getReviewAllCount_bath() {
		
		return reviewmapper.getReviewAllCount_bath();
	}

	@Override
	public List<Review> getReviewList_bath(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        return reviewmapper.getReviewList_bath(rowBounds);
	}
	
	
	@Override
	@Transactional
	public int review_fupload(Review review) {

		int result = 0;
		result = reviewmapper.review_fupload(review);
		
		return result;
	}

	@Override
	public int search_list(String search) {

		
		
		return reviewmapper.review_search(search);
	}

	@Override
	public List<Review> search_board(PageInfo pageInfo, String search) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return reviewmapper.search_mboard(rowBounds, search);
	}





}
