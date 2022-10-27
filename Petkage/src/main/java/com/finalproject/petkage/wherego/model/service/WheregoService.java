package com.finalproject.petkage.wherego.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Heart;
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

    int insertWherego_lodging(Wherego wherego);

    int insertWherego_others(Wherego wherego);

    Wherego findBoardByNo_lodging(int no);

	Wherego findBoardByNo_cafe(int no);

    List<Wherego> getListWheregoRecommend();

	int wherego_like(Heart heart);

	int insert_like(Heart heart);

	int delete_like(Heart heart);

	List<Wherego> lodging_board_cate(String filter, String location);

	List<Wherego> cafe_board_cate(String location, String opt);

}
