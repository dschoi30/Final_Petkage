package com.finalproject.petkage.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.mypage.model.service.MyPageService;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Heart;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@GetMapping("/myPage_main")
	public String myPageMain() {
		
		return "mypage/myPage_main";
	}
		
	@GetMapping("/myPage_calendar")
	public String myPageCalendar() {
		
		return "mypage/myPage_calendar";
	}
		
	@GetMapping("/myPage_userModify")
	public String myPageUserModify() {
		
		return "mypage/myPage_userModify";
	}
	
	@GetMapping("/myPage_prevModify")
	public String myPageprevModify() {
		
		return "mypage/myPage_prevModify";
	}
	
	@GetMapping("/myPage_pwdModify")
	public String myPagepwdModify() {
		
		return "mypage/myPage_pwdModify";
	}
	
	// 마이페이지 get
		@GetMapping("/myPage_orderList")
		public ModelAndView orderList(ModelAndView model, @SessionAttribute("loginMember") Member loginMember,
				@RequestParam(value = "page", defaultValue = "1") int page) {
				List<Payment> payment = null;			
				PageInfo pageInfo = null;

		        pageInfo = new PageInfo(page, 10, service.getOrderAllCount(), 10);
		        payment = service.getOrderList(pageInfo, loginMember.getNo());
		        
		        System.out.println(payment);

		        model.addObject("payment", payment);
		        model.addObject("pageInfo", pageInfo);
		        model.setViewName("mypage/myPage_orderList");

			return model;
		}
		
		@GetMapping("/myPage_heart")
	    public ModelAndView HeartList(@SessionAttribute("loginMember") Member loginMember, ModelAndView model, 
	            @RequestParam(value = "page", defaultValue = "1") int page) {
	        List<Heart> heart = null;
	        PageInfo pageInfo = null;

	        pageInfo = new PageInfo(page, 10, service.getHeartAllCount(), 10);
	        heart = service.getHeartList(pageInfo, loginMember.getNo());
	        
	        System.out.println(heart);
	        
	        model.addObject("heart", heart);
	        model.addObject("pageInfo", pageInfo);
	        model.setViewName("mypage/myPage_heart");

	        System.out.println(heart);
	        
	        return model;

	    }
		
		@GetMapping("/myPage_wroteReviews")
	    public ModelAndView WroteReview_list(@SessionAttribute("loginMember") Member loginMember, ModelAndView model, 
	            @RequestParam(value = "page", defaultValue = "1") int page) {
//	        List<Payment> payment = null;
	        List<Review> review = null;
	        PageInfo pageInfo = null;

	        pageInfo = new PageInfo(page, 10, service.getWhReviewAllCount(), 10);
//	        payment = service.getPdReviewList(pageInfo, loginMember.getNo());
	        review = service.getWhReviewList(pageInfo, loginMember.getNo());
	        
//	        System.out.println(payment);
	        System.out.println(review);
	        
	        model.addObject("review", review);
//	        model.addObject("payment", payment);
	        model.addObject("pageInfo", pageInfo);
	        model.setViewName("mypage/myPage_wroteReviews");

//	        System.out.println(payment);
	        System.out.println(review);
	        
	        return model;

	    }

}
