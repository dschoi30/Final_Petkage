package com.finalproject.petkage.wherego.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

}
