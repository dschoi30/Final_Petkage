package com.finalproject.petkage.tools.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.finalproject.petkage.tools.model.vo.Food;

@Mapper
public interface ToolsMapper {

    Food selectFoodByKeyWord(@Param("foodName") String foodName);

}
