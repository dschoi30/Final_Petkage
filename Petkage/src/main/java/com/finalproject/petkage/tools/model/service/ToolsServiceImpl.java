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
        System.out.println("서비스임플 : " + foodName);
        
        return mapper.selectFoodByKeyWord(foodName);
    }

}
