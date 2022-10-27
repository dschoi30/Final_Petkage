package com.finalproject.petkage.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.admin.model.service.AdminService;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.notice.model.vo.Notice;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Wherego;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 회원
	@GetMapping("/admMain")
	public ModelAndView admMain(ModelAndView model) {
		
		model.setViewName("admin/admMain");
		
		return model;
	}
	
	@GetMapping("/memList")
	public ModelAndView admMemList(ModelAndView model,
			@RequestParam(value ="page", defaultValue = "1") int page,
			@RequestParam(value ="memtype", required = false) String memtype,
			@RequestParam(value ="search", required = false) String search) {	
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		int memCount = service.getMemCount(memtype, search);
		pageInfo = new PageInfo(page, 10, service.getMemCount(memtype, search), 10);
		
		list = service.getMemList(pageInfo, memtype, search);
				
		model.addObject("memCount", memCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/memList");
		
		return model;
	}
	
	@GetMapping("/changeMem")
	public ModelAndView delete(ModelAndView model, 
					@SessionAttribute("loginMember") Member loginMember,
					@RequestParam int no) {
		int result = 0;

		Member member = service.findMemberByNo(no);	

		if("ROLE_ADMIN".equals(loginMember.getMemberRole())) {
			result = service.memUpdateStatus(member);
			
			log.debug("result 호출");
			
			if(result > 0) {
				model.addObject("msg", "회원상태를 변경시켰습니다.");
				model.addObject("location", "/admin/memList");
			} else {
				model.addObject("msg", "상태 변경에 실패했습니다.");
				model.addObject("location", "/admin/memList");
			}
		} else {
			model.addObject("msg", "관리자가 아닙니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
		
	@GetMapping("/memXList")
	public ModelAndView admMemXList(ModelAndView model,
			@RequestParam(value ="page", defaultValue = "1") int page,
			@RequestParam(value ="memtype", required = false) String memtype,
			@RequestParam(value ="search", required = false) String search) {
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		int memXCount = service.getMemXCount(memtype, search);
		pageInfo = new PageInfo(page, 10, service.getMemXCount(memtype, search), 10);
		
		list = service.getMemXList(pageInfo, memtype, search);
				
		model.addObject("memXCount", memXCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/memXList");
		
		return model;
	}
	
	// 어디가지
	@GetMapping("/boardList")
	public ModelAndView BoardList(ModelAndView model,
			@RequestParam(value ="page", defaultValue = "1") int page,
			@RequestParam(value ="boardtype", defaultValue = "name") String boardtype,
			@RequestParam(value ="search", required = false) String search) {
		
		List<Wherego> list = null;
		PageInfo pageInfo = null;
		
		int boardCount = service.getBoardCount(boardtype, search);
		pageInfo = new PageInfo(page, 10, service.getBoardCount(boardtype, search), 10);
		
		list = service.getBoardList(pageInfo, boardtype, search);
				
		model.addObject("boardCount", boardCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/boardList");
		
		return model;
	}
	
	// 상품
	@GetMapping("/proList")
	public ModelAndView ProductList(ModelAndView model,
			@RequestParam(value ="page", defaultValue = "1") int page,
			@RequestParam(value ="type", required = false) String searchtype,
			@RequestParam(value ="search", required = false) String search) {
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		int productCount = service.getProCount(searchtype, search);
		pageInfo = new PageInfo(page, 10, service.getProCount(searchtype, search), 10);
		
		list = service.getProductList(pageInfo, searchtype, search);
				
		model.addObject("productCount", productCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/proList");
		
		return model;
	}
	
	// 리뷰
	@GetMapping("/revList")
	public ModelAndView ReviewList(ModelAndView model,
			@RequestParam(value ="page", defaultValue = "1") int page,
			@RequestParam(value ="type", required = false) String categorytype,
			@RequestParam(value ="type2", required = false) String searchtype,
			@RequestParam(value ="search", required = false) String search) {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		
		int reviewCount = service.getRevCount(categorytype, searchtype, search);
		pageInfo = new PageInfo(page, 10, service.getRevCount(categorytype, searchtype, search), 10);
		
		list = service.getReviewList(pageInfo, categorytype, searchtype, search);
		
		model.addObject("reviewCount", reviewCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("admin/revList");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
}
