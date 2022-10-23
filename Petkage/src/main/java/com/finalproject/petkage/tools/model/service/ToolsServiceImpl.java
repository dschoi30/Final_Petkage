package com.finalproject.petkage.tools.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.petkage.tools.model.mapper.ToolsMapper;
import com.finalproject.petkage.tools.model.vo.Food;

@Service
public class ToolsServiceImpl implements ToolsService {
    
    @Autowired
    private ToolsMapper mapper;
    
    @Override
    public Food findFood(String foodName) {
        System.out.println("식품 검색 : " + foodName);
        
        return mapper.selectFoodByKeyWord(foodName);
    }

    @Override
    public int addFood(HashMap<String, Object> food) {
        System.out.println("새로운 식품 추가 : " + food);
        
        return mapper.insertFood(food);
    }

    @Override
    public int duplicateFood(HashMap<String, Object> food) {
        System.out.println("식품 중복 검사 : " + food);
        
        return mapper.foodCheck(food);
    }
}