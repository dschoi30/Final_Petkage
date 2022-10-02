package com.finalproject.petkage.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired 
	private MarketService service;
	
	@GetMapping("product-write")
	public String write() {
		
		log.info("게시글 작성 페이지 요청");
		
		return "market/product-write";
	}
	
	@PostMapping("/product-write")
	public String write (@ModelAttribute Product product) {
		System.out.println(product);
		
		return "market/product-view";
	}
	
	@GetMapping("/product-list")
	public ModelAndView List(ModelAndView model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getProductCount(), 8);
		list = service.getProductList(pageInfo);
		System.out.println(list);
		System.out.println(pageInfo);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("market/product-list");
		
		return model;
	}
	
	@GetMapping("/product-view")
	public ModelAndView View(ModelAndView model, @RequestParam int proNo ) {

		System.out.println(proNo);
		
		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		model.addObject("product", product);
		
		model.setViewName("market/product-view");
		
		return model;
	}
}
