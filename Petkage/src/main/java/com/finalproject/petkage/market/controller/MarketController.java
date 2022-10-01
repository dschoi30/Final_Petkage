package com.finalproject.petkage.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Product;

@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired 
	private MarketService service;
	
	@GetMapping("product-write")
	public String write() {
		return "market/product-write";
	}
	
	@PostMapping("/product-write")
	public ModelAndView write (ModelAndView model){
		return model;
	}
	
	@GetMapping("/product-list")
	public ModelAndView List(ModelAndView model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getProductCount(), 10);
		list = service.getProductList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("market/product-list");
		
		return model;
	}
}
