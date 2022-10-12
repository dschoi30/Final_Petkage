package com.finalproject.petkage.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.member.model.service.MemberService;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.member.model.vo.Pet;
import com.finalproject.petkage.member.model.vo.Seller;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService service;
	
	// 로그인 페이지 처리
	@GetMapping("/login")
	public String loginPage() {
		log.info("로그인 페이지 요청");
		
		return "member/login";
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public ModelAndView login(HttpSession session, ModelAndView model, 
			@RequestParam String userId, @RequestParam String userPwd) {
		log.info("{}, {}", userId, userPwd);

		Member loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			
			if(loginMember.getMemberRole().equals("ROLE_USER")) {
				// 일반 회원 로그인 했을 경우
				model.addObject("msg", "일반 회원 로그인");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
			} else if (loginMember.getMemberRole().equals("ROLE_SELLER")){
				// 판매 회원 로그인 했을 경우
				model.addObject("msg", "판매 회원 로그인");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
			} else {
				// 관리자 회원 로그인 했을 경우
				model.addObject("msg", "관리자 로그인");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
			}
		} else {
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다. ");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		System.out.println(loginMember);
		
		return model;
	}
		
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃 성공");
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 회원가입 페이지 처리
	@GetMapping("/enroll")
	public String enrollPage() {
		log.info ("회원가입 페이지 요청");
		
		return "member/enroll";
	}
	
	// 회원가입 처리
	@PostMapping("/enroll")
	public ModelAndView enroll(HttpSession session,
								ModelAndView model, 
								@ModelAttribute Member member, 
								@ModelAttribute Pet pet, 
								@ModelAttribute Seller seller) {
		int result = 0;

		log.info(member.toString());
		log.info(pet.toString());
		log.info(seller.toString());
		
		member.setPet(pet);
		member.setSeller(seller);
		
		result = service.saveMember(member);
		
		String enrollMemName = member.getUserName();
		System.out.println(enrollMemName);

		if(result > 0) {
			// 단순 로그인했을 때 가입완료 페이지접근 X - 테스트 완료
			session.setAttribute("enrollMemName", enrollMemName);
			
			model.addObject("msg", "당신의 Petkage를 시작하세요.");
			model.addObject("location", "/member/enrollFinish");
				
		} else {
			model.addObject("msg", "회원가입에 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 회원가입 완료 페이지 처리
	@GetMapping("/enrollFinish")
	public String enrollFinishPage() {
		// 단순 로그인했을 때 접근 X - 테스트 완료
		log.info ("회원가입 완료 페이지 요청");

		return "member/enrollFinish";

	}
	
	// 아이디 중복 체크
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(ModelAndView model, @RequestParam String userId) {
		int result = service.idCheck(userId);
		
		if(result != 0) {
			// 중복 아이디 O
			log.info("아이디 중복 테스트 fail");

			return "fail";
		} else {
			// 중복 아이디 X
			log.info("아이디 중복 테스트 success");

			return "success";
		}
	}
	
	// 이메일 중복 체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(ModelAndView model, @RequestParam String userEmail) {
		int result = service.emailCheck(userEmail);
		
		if(result != 0) {
			// 중복 이메일 O
			log.info("이메일 중복 테스트 fail");
			
			return "fail";
		} else {
			// 중복 이메일 X
			log.info("이메일 중복 테스트 success");

			return "success";
		}
	}
	
	// 아이디 찾기 페이지 처리
	@GetMapping("/findMyId")
	public String findMyIdPage() {
		log.info ("아이디 찾기 페이지 요청");
		
		return "member/findMyId";
	}
	
	// 비밀번호 찾기 페이지 처리
	@GetMapping("/findMyPwd")
	public String findMyPwdPage() {
		log.info ("비밀번호 찾기 페이지 요청");
		
		return "member/findMyPwd";
	}
}
