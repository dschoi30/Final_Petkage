package com.finalproject.petkage.board.wherego;

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
		
		return "board/wherego/wherego_main";
	}
	
	@RequestMapping("/test1")
	public String test1() {
		
		return "board/wherego/wherego_cafe_detail";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		
		return "board/wherego/wherego_cafe";
	}
}
