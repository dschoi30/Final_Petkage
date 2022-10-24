package com.finalproject.petkage.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.admin.model.service.AdminService;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Wherego;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admMain")
	public ModelAndView admMain(ModelAndView model) {
		
		model.setViewName("admin/admMain");
		
		return model;
	}
	
	@GetMapping("/memList")
	public ModelAndView admMemList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {	
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		int memCount = service.getMemCount();
		pageInfo = new PageInfo(page, 10, service.getMemCount(), 10);

		list = service.getMemList(pageInfo);
				
		model.addObject("memCount", memCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/memList");
		
		return model;
	}
	
	@PostMapping("/memList")
	public ModelAndView admMemsearchList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page,
					@RequestParam(value ="memtype") String memtype,
					@RequestParam(value ="search") String search) {	
		
		List<Member> list = null;
//		PageInfo pageInfo = null;
		
//		int memCount = service.getMemCount(memtype, search);
//		pageInfo = new PageInfo(page, 10, service.getMemCount(), 10);

		System.out.println(memtype);
		System.out.println(search);
		
//		list = service.getMemList(pageInfo);
//		list = service.getMemList(memtype, search);
		
		System.out.println(list);
		System.out.println(list.size());
//				
//		model.addObject("memCount", memCount); 
//		model.addObject("pageInfo", pageInfo);
//		model.addObject("list", list); 
		model.setViewName("admin/memList");
		
		return model;
	}
	
	@GetMapping("/memXList")
	public ModelAndView admMemXList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		int memXCount = service.getMemXCount();
		pageInfo = new PageInfo(page, 10, service.getMemXCount(), 10);
		
		System.out.println(pageInfo);
		list = service.getMemXList(pageInfo);
				
		model.addObject("memXCount", memXCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/memXList");
		
		return model;
	}
	
	@GetMapping("/boardList")
	public ModelAndView BoardList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {
		
		List<Wherego> list = null;
		PageInfo pageInfo = null;
		
		int boardCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 10);
		
		System.out.println(pageInfo);
		list = service.getBoardList(pageInfo);
				
		model.addObject("boardCount", boardCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/boardList");
		
		return model;
	}
	
	@GetMapping("/proList")
	public ModelAndView ProductList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		int productCount = service.getProCount();
		pageInfo = new PageInfo(page, 10, service.getProCount(), 10);
		
		System.out.println(pageInfo);
		list = service.getProductList(pageInfo);
				
		model.addObject("productCount", productCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/proList");
		
		return model;
	}
	
	@GetMapping("/revList")
	public ModelAndView ReviewList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		
		int reviewCount = service.getRevCount();
		pageInfo = new PageInfo(page, 10, service.getRevCount(), 10);
		
		System.out.println(pageInfo);
		list = service.getReviewList(pageInfo);
				
		model.addObject("reviewCount", reviewCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/revList");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
}
