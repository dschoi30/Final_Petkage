package com.finalproject.petkage.wherego.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
}
