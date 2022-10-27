package com.finalproject.petkage.wherego.model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.petkage.common.util.MultipartFileUtil;
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
        String roomTypeNo = wherego.getRoom().getRoomTypeNo();
        String roomName = wherego.getRoom().getRoomName();
        String roomPrice = wherego.getRoom().getRoomPrice();
        String roomImg = wherego.getRoom().getRoomImg();
        String renameRoomImg = wherego.getRoom().getRenameRoomImg();
        String MInfo = wherego.getRoom().getMInfo();
        String MAmeni = wherego.getRoom().getMAmeni();
        
        System.out.println("객실수 : " + roomNum);
        System.out.println("객실타입번호 : " + roomTypeNo); 
        System.out.println("객실명 : " + roomName); 
        System.out.println("객실가격 : " + roomPrice); 
        System.out.println("객실이미지 : " + roomImg); 
        System.out.println("객실이미지개명 : " + renameRoomImg); 
        System.out.println("모달 정보 : " + MInfo); 
        System.out.println("모달 편의 : " + MAmeni);
        
        String[] roomTypeNoArr = roomTypeNo.split(",");
        String[] roomNameArr = roomName.split(",");
        String[] roomPriceArr = roomPrice.split(",");
        String[] roomImgArr = roomImg.split(", ");
        String[] renameRoomImgArr = renameRoomImg.split(", ");
        String[] mInfoArr = MInfo.split(",");
        String[] mAmeniArr = MAmeni.split(",");
       
        // 숙소 등록
        result = mapper.insertWherego_lodging(wherego);
       
        wherego.getRoom().setSpotNo(wherego.getSpotNo());

        // 객실 등록 
        for (int i = 0; i < roomNum; i++) {
            wherego.getRoom().setRoomTypeNo(roomTypeNoArr[i]);
            wherego.getRoom().setRoomName(roomNameArr[i]);
            wherego.getRoom().setRoomPrice(roomPriceArr[i]);
            wherego.getRoom().setRoomImg(roomImgArr[i]);
            wherego.getRoom().setRenameRoomImg(renameRoomImgArr[i]);
            wherego.getRoom().setMInfo(mInfoArr[i]);
            wherego.getRoom().setMAmeni(mAmeniArr[i]);
            
            System.out.println("객실" + i + "번 출력 " + wherego.getRoom());
            
            result = mapper.insertRoom(wherego.getRoom());
        }
        
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
	public List<Wherego> lodging_board_cate(String filter, String location) {

		return mapper.lodging_board_cate(filter, location);
	}

	@Override
	public List<Wherego> cafe_board_cate(String location, String opt) {
		
		return mapper.cafe_board_cate(location, opt);
	}


	
    






}
