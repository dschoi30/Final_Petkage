package com.finalproject.petkage.wherego.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.wherego.model.vo.Wherego;

public interface WheregoService {

	List<Wherego> lodging_board();

	List<Wherego> cafe_board();

	List<Wherego> food_board();

	List<Wherego> hair_board();

	List<Wherego> trip_board();

	List<Wherego> hospital_board();

	List<Wherego> preschool_board();

	List<Wherego> bath_board();

	List<Wherego> petsitter_board();

	int search_list_lod(String search);

	List<Wherego> search_board_lod(PageInfo pageInfo, String search);

    int insertWherego(Wherego wherego);

	Wherego findBoardByNo_lodging(int no);

	Wherego findBoardByNo_cafe(int no);

	
	
}
