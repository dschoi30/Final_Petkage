package com.finalproject.petkage.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@GetMapping("/myPage_main")
	public String myPageMain() {
		
		return "mypage/myPage_main";
	}
	
	@GetMapping("/myPage_orderList")
	public String myPageOrderList() {
		
		return "mypage/myPage_orderList";
	}
	
	@GetMapping("/myPage_calendar")
	public String myPageCalendar() {
		
		return "mypage/myPage_calendar";
	}
	
	
	@GetMapping("/myPage_heart")
	public String myPageHeart() {
		
		return "mypage/myPage_heart";
	}
	
	@GetMapping("/myPage_reviewAble")
	public String myPageReviewAble() {
		
		return "mypage/myPage_reviewAble";
	}
	
	@GetMapping("/myPage_wroteReviews")
	public String myPagewroteReviews() {
		
		return "mypage/myPage_wroteReviews";
	}
	
	@GetMapping("/myPage_productReview")
	public String myPageProductReview() {
		
		return "mypage/myPage_productReview";
	}
	
	@GetMapping("/myPage_userModify")
	public String myPageUserModify() {
		
		return "mypage/myPage_userModify";
	}

}
