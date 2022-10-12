package com.finalproject.petkage.tools.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.tools.model.service.ToolsService;
import com.finalproject.petkage.tools.model.vo.Food;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tools")
public class ToolsController {
	
	@Autowired
	private ToolsService service;
	
	@GetMapping("/toolsMain")
	public String toolsMain() {
		log.info("펫키지 툴즈 메인화면 요청");
		
		return "tools/toolsMain";
	}
	
	@GetMapping("/ageCalculator")
	public String ageCal() {
		log.info("펫키지 툴즈 나이 계산기 요청");
		
		return "tools/ageCalculator";
	}
	
	@GetMapping("/bmiCalculator")
	public String bmiCal() {
		log.info("펫키지 툴즈 비만도 계산기 요청");
		
		return "tools/bmiCalculator";
	}
	
	@GetMapping("/calorieCalculator")
	public String calorieCal() {
		log.info("펫키지 툴즈 칼로리 계산기 요청");
		
		return "tools/calorieCalculator";
	}
	
	@GetMapping("/foodDictionary")
	public String foodDic() {
		log.info("펫키지 툴즈 식품사전 요청");
		
		return "tools/foodDictionary";
	}
	
	@GetMapping("/walkOutRecommend")
	public String walkOut() {
		log.info("펫키지 툴즈 산책코스 요청");
		
		return "tools/walkOutRecommend";
	}
	
	@RequestMapping(value = "/eatThis", method = { RequestMethod.GET })
    public ModelAndView foodSearch (
            ModelAndView model, @RequestParam(value = "foodName", required = false) String foodName) { 
	    
	    log.info("입력한 과일 이름 : " + foodName);
	    
        Food food = null;
        System.out.println("서비스 전 : " + food);
        
        food = service.findFood(foodName);
        
        System.out.println("서비스 후 : " + food);
        
        model.addObject("food", food);
        model.setViewName("tools/eatThis");

        return model;
	}	
	
	@RequestMapping("/ageResult")
	public ModelAndView ageResult (
	        ModelAndView model) {
	    
	    return model;
	}
	
	
}
