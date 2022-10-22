package com.finalproject.petkage.wherego.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.wherego.model.mapper.WheregoMapper;
import com.finalproject.petkage.wherego.model.vo.Wherego;

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

    @Override
    @Transactional
    public int insertWherego(Wherego wherego) {
        int result = 0;
        int roomNum = wherego.getRoomNum();
        int roomTypeNo = wherego.getRoom().getRoomTypeNo();
        
        // roomNum 갯수 따라서 객실 입력 반복
        
        
        result = mapper.insertWherego(wherego);
        wherego.getRoom().setSpotNo(wherego.getSpotNo());
        result = mapper.insertRoom(wherego.getRoom());
        
        return result;
    }

	@Override
	public Wherego findBoardByNo(int no) {

		return mapper.findBoardByNo(no);
	}
    


	
}
