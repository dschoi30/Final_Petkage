package com.finalproject.petkage.wherego.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalproject.petkage.wherego.model.vo.Wherego;

@Mapper
public interface WheregoMapper {

	List<Wherego> cafe_board();

	List<Wherego> lodging_board();

}
