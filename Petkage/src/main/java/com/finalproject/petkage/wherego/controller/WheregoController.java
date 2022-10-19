package com.finalproject.petkage.wherego.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.market.controller.MarketController;
import com.finalproject.petkage.wherego.model.service.WheregoService;
import com.finalproject.petkage.wherego.model.vo.Wherego;


@Controller
public class WheregoController {
	@Autowired
	private WheregoService service;
	
	@GetMapping("/main")
	public String main() {
		
		return "wherego/wherego_main";
	}
	
	@GetMapping("/cafedetail")
	public String cafedetail() {
		
		return "wherego/wherego_cafe_detail";
	}
	
	@GetMapping("/cafe")
	public ModelAndView cafe(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.cafe_board(); 
		
		model.addObject("cafeselect", wherego);
		model.setViewName("wherego/wherego_cafe");
		
		return model;
	}
	
	@GetMapping("/lodging")
	public ModelAndView lodging(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.lodging_board(); 
		
		model.addObject("lodgingselect", wherego);
		model.setViewName("wherego/wherego_lodging");
		
		return model;
	}
	
	@GetMapping("/lodgingdetail")
	public String lodgingdetail() {
		
		return "wherego/wherego_lodging_detail";
	}
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/reviewboard")
	public String reivewboard() {
		
		return "wherego/wherego_review_board";
	}
	
	@GetMapping("/reviewwrite")
	public String reivewwrite() {
		
		return "wherego/wherego_review_write";
	}
	
	@GetMapping("/petsitter")
	public String petsitter() {
		
		return "wherego/wherego_petsitter_detail";
	}
	
	@GetMapping("/manager1")
	public String manager1() {
		
		return "wherego/wherego_manager_1";
	}
	
	@GetMapping("/manager2")
	public String manager2() {
		
		return "wherego/wherego_manager_2";
	}
}
