package com.finalproject.petkage.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.mypage.model.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@GetMapping("/mypage/myPage_main")
	public String myPageMain() {
		
		return "mypage/myPage_main";
	}
	
	@GetMapping("/mypage/myPage_orderList")
	public String myPageOrderList() {
		
		return "mypage/myPage_orderList";
	}
	
	@GetMapping("/mypage/myPage_calendar")
	public String myPageCalendar() {
		
		return "mypage/myPage_calendar";
	}
	
	
	@GetMapping("/mypage/myPage_heart")
	public String myPageHeart() {
		
		return "mypage/myPage_heart";
	}
	
	@GetMapping("/mypage/myPage_reviewAble")
	public String myPageReviewAble() {
		
		return "mypage/myPage_reviewAble";
	}
	
	@GetMapping("/mypage/myPage_wroteReviews")
	public String myPagewroteReviews() {
		
		return "mypage/myPage_wroteReviews";
	}
	
	@GetMapping("/mypage/myPage_productReview")
	public String myPageProductReview() {
		
		return "mypage/myPage_productReview";
	}
	
	@GetMapping("/mypage/myPage_userModify")
	public String myPageUserModify() {
		
		return "mypage/myPage_userModify";
	}
	
	@GetMapping("/mypage/myPage_prevModify")
	public String myPageprevModify() {
		
		return "mypage/myPage_prevModify";
	}
	
	@GetMapping("/mypage/myPage_pwdModify")
	public String myPagepwdModify() {
		
		return "mypage/myPage_pwdModify";
	}
	
	//@GetMapping("/myPage_prevModify")
//    public void getPrevModify(Authentication auth) {
//
//    }
// 
// @PostMapping("/myPage_prevModify")
//    public String postPrevModify(Authentication auth, @RequestParam("userpw") String pw, RedirectAttributes rttr) {
//        Member user = (Member) auth.getPrincipal();
//        String userpw = user.getUserPwd();
//        if(encoder.matches(pw, userpw)) {
//            log.info("pw 재확인 완료..");
//            return "redirect:/mypage/myPage_modify";
//        }
//        else {
//            rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
//            return "redirect:/mypage/myPage_prevModify";
//        }
//    }

}
