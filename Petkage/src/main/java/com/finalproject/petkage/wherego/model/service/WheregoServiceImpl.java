package com.finalproject.petkage.wherego.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.mapper.WheregoMapper;
import com.finalproject.petkage.wherego.model.vo.Heart;
import com.finalproject.petkage.wherego.model.vo.Wherego;
import com.finalproject.petkage.wherego.model.vo.avgReview;

@Service
public class WheregoServiceImpl implements WheregoService {
	@Autowired
	private WheregoMapper mapper;
	
	@Override
	public List<Wherego> lodging_board() {

		return mapper.lodging_board();
	}

	@Override
	public List<Wherego> cafe_board() {
		
		return mapper.cafe_board();
	}

	@Override
	public List<Wherego> food_board() {
		
		return mapper.food_board();
	}

	@Override
	public List<Wherego> hair_board() {
		
		return mapper.hair_board();
	}

	@Override
	public List<Wherego> trip_board() {
		
		return mapper.trip_board();
	}

	@Override
	public List<Wherego> hospital_board() {
		
		return mapper.hospital_board();
	}

	@Override
	public List<Wherego> preschool_board() {
		
		return mapper.preschool_board();
	}

	@Override
	public List<Wherego> bath_board() {

		return mapper.bath_board();
	}

	@Override
	public List<Wherego> petsitter_board() {

		return mapper.petsitter_board();
	}

	@Override
	public int search_list_lod(String search) {

		return mapper.search_list_lod(search);
	}

	@Override
	public List<Wherego> search_board_lod(PageInfo pageInfo, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.search_board_lod(rowBounds, search);
	}

	// 숙소 게시글 작성
    @Override
    @Transactional
    public int insertWherego_lodging(Wherego wherego) {
        int result = 0;
        int roomNum = wherego.getRoomNum();
        int roomTypeNo = wherego.getRoom().getRoomTypeNo();
        
        System.out.println("객실수" + roomNum);
        System.out.println("객실타입번호" + roomTypeNo); 
        
        // 조건문 만들어서 INSERT
//        if 
        
        result = mapper.insertWherego_lodging(wherego);
        wherego.getRoom().setSpotNo(wherego.getSpotNo());
        result = mapper.insertRoom(wherego.getRoom());
        
        return result;
    }

    // 숙소 제외 다른 카테고리 게시글 작성
    @Override
    @Transactional
    public int insertWherego_others(Wherego wherego) {
        int result = 0;
        
        result = mapper.insertWherego_others(wherego);
        
        return result;
    }
    
    @Override
    public Wherego findBoardByNo_lodging(int no) {
    
        return mapper.findBoardByNo_lodging(no);
    }
    
    @Override
    public Wherego findBoardByNo_cafe(int no) {
    
        return mapper.findBoardByNo_cafe(no);
    }

    // 어디가지 게시글 별점 순 10개 리스트 
    @Override
    public List<Wherego> getListWheregoRecommend() {
        
        return mapper.getListWheregoRecommend();
    }

	@Override
	public int wherego_like(Heart heart) {

		return mapper.wherego_like(heart);
	}

	@Override
	public int insert_like(Heart heart) {

		return mapper.insert_like(heart);
	}

	@Override
	public int delete_like(Heart heart) {
		
		return mapper.delete_like(heart);
		
	}

	@Override
	public void reviewAvg(String spotName) {
        Double reviewAvg = mapper.reviewAvg(spotName);

        if(reviewAvg == null) {
        	reviewAvg = 0.0;
        }

        avgReview reviewStar = new avgReview();
        reviewStar.setSpotName(spotName);
        reviewStar.setReviewAvg(reviewAvg);

        System.out.println(reviewAvg);
        System.out.println(reviewStar);
        
        mapper.updateReviewAvg(reviewStar);
		
	}



}
