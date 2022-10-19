package com.finalproject.petkage.tools.model.service;

import com.finalproject.petkage.tools.model.vo.Food;

public interface ToolsService {
    
    Food findFood (String foodName);

    int addFood(Food food);

}
