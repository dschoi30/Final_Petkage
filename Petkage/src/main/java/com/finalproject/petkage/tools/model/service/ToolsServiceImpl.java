package com.finalproject.petkage.tools.model.service;

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
    public int addFood(Food food) {
        System.out.println("새로운 식품 추가 : " + food);
        
        return mapper.insertFood(food);
    }

}
