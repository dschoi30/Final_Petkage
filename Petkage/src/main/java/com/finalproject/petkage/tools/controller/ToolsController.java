package com.finalproject.petkage.tools.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.petkage.member.model.vo.Member;
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

// 	@RequestMapping("/foodAdd")
// 	@ResponseBody
// 	public ModelAndView foodAdd (
// 	       ModelAndView model,
// 	       @ModelAttribute Food food
// //	       @RequestParam(value = "food_name", required = false) String foodName,
// //	       @RequestParam(value = "food_comment", required = false) String comment,
// //	       @RequestParam(value = "food_subcomment", required = false) String subComment,
// //	       @RequestParam(value = "eatThis_type", required = false) String eatThis
// 	        ) {
// 	    System.out.println(food); // PAYLOAD는 되는데 객체로 안찍힘
//	    
// //		int result = 0;
// //
// //		result = service.addFood(food);
// //
// //		if(result > 0) {
// //			model.addObject("msg", "새로운 식품이 등록되었습니다.");
// //		} else {
// //			model.addObject("msg", "새로운 식품 등록에 실패하였습니다.");
// //			model.addObject("location", "tools/foodDictionary");
// //		}
// //		model.setViewName("common/msg");
//		
//// 	    return model;
//// 	}	

	@RequestMapping("/foodAdd")
	@ResponseBody
    public Map<String, Object> foodAdd(@RequestBody HashMap<String, Object> food){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
        System.out.println("파라미터 객체 : " + food);
        
		int duplicateFood = service.duplicateFood(food);
		int result = 0;

		if(duplicateFood != 0) {
		    System.out.println("중복 값 있음:" + duplicateFood);
		    
            resultMap.put("data", "fail");
            return resultMap;
		} else {
		    System.out.println("중복 값 없음:" + duplicateFood);

		    result = service.addFood(food);
            
            if(result > 0) {
                System.out.println("값:" + result);
                resultMap.put("data", "success");
                return resultMap;
            } else {
                resultMap.put("data", "fail");
                return resultMap;
            }
		} 
    }
}
