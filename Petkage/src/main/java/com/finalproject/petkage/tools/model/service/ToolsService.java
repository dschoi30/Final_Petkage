package com.finalproject.petkage.tools.model.service;

import java.util.HashMap;

import com.finalproject.petkage.tools.model.vo.Food;

public interface ToolsService {
    
    Food findFood (String foodName);

    int addFood(HashMap<String, Object> food);

    int duplicateFood(HashMap<String, Object> food);

}
