package com.finalproject.petkage.wherego.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Heart;
import com.finalproject.petkage.wherego.model.vo.Room;
import com.finalproject.petkage.wherego.model.vo.Wherego;

@Mapper
public interface WheregoMapper {

	List<Wherego> cafe_board();

	List<Wherego> lodging_board();

	List<Wherego> food_board();

	List<Wherego> hair_board();

	List<Wherego> trip_board();

	List<Wherego> hospital_board();

	List<Wherego> preschool_board();

	List<Wherego> bath_board();

	List<Wherego> petsitter_board();

	int search_list_lod(String search);

	List<Wherego> search_board_lod(RowBounds rowBounds, String search);

    int insertWherego_lodging(Wherego wherego);

    int insertRoom(Room room);

    int insertWherego_others(Wherego wherego);

    Wherego findBoardByNo_lodging(int no);

	Wherego findBoardByNo_cafe(int no);

    List<Wherego> getListWheregoRecommend();

	int wherego_like(Heart heart);

	int insert_like(Heart heart);

	int delete_like(Heart heart);

	Double reviewAvg(String spotName);

	List<Wherego> lodging_board_cate(@Param("filter") String filter, @Param("location") String location);

	List<Wherego> cafe_board_cate(@Param("location") String location, @Param("opt") String opt);

    Room findBoardByNo_room(int no);
	
}
