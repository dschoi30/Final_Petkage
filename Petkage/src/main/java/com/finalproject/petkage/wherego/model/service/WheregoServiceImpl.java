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

	
}
