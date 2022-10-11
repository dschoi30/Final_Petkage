package com.finalproject.petkage.tools.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.petkage.tools.model.service.ToolsService;

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
		log.info("펫키지 툴즈 비만도 계산기 요청");
		
		return "tools/calorieCalculator";
	}
	
	@GetMapping("/foodDictionary")
	public String foodDic() {
		log.info("펫키지 툴즈 비만도 계산기 요청");
		
		return "tools/foodDictionary";
	}
	
	@GetMapping("/walkOutRecommend")
	public String walkOut() {
		log.info("펫키지 툴즈 비만도 계산기 요청");
		
		return "tools/walkOutRecommend";
	}
	
//	@RequestMapping(value="/calResult", method= {RequestMethod.POST})
//	@ResponseBody
//	public String resultAjax() {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		map.put("kor", "Korea");
//	        map.put("us", "United States");
//
//		return null;
//	}
	
	
	
}
