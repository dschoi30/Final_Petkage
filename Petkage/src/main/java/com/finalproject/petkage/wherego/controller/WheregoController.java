package com.finalproject.petkage.wherego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.market.controller.MarketController;


@Controller
public class WheregoController {

	@RequestMapping("/test")
	public String test() {
		
		return "wherego/wherego_main";
	}
	
	@RequestMapping("/test1")
	public String test1() {
		
		return "wherego/wherego_cafe_detail";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		
		return "wherego/wherego_cafe";
	}
	
	@RequestMapping("/lodging")
	public String lodging() {
		
		return "wherego/wherego_lodging";
	}
	
	@RequestMapping("/manager1")
	public String manager1() {
		
		return "wherego/wherego_manager_1";
	}
	
	@RequestMapping("/manager2")
	public String manager2() {
		
		return "wherego/wherego_manager_2";
	}
}
