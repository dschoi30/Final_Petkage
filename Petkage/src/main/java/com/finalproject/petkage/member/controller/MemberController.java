package com.finalproject.petkage.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	
	@Autowired
    private JavaMailSender mailSender;
		
	// 로그인 페이지 처리 - OK
	@GetMapping("/loginPage")
	public String loginPage() {
		log.info("로그인 페이지 요청");
		
		return "member/login";
	}
	
	// 로그인 처리 - OK
	@PostMapping("/login")
	public ModelAndView login(HttpSession session, 
							  ModelAndView model, 
							  @RequestParam String userId, 
							  @RequestParam String userPwd) {
		log.info("{}, {}", userId, userPwd);

		Member loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			
			if(loginMember.getMemberRole().equals("ROLE_USER")) {
				// 일반 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 일반 회원입니다.");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
				
			} else if (loginMember.getMemberRole().equals("ROLE_SELLER")){
				// 판매 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 판매자 회원입니다.");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
				
			} else {
				// 관리자 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 관리자입니다.");
				model.setViewName("common/msg");
				System.out.println(loginMember.getMemberRole());
				
			}
		} else {
			model.addObject("msg", "[Petkage] 아이디나 비밀번호가 일치하지 않습니다. ");
			model.addObject("location", "/member/loginPage");
			model.setViewName("common/msg");
		}
		
		System.out.println(loginMember);
		
		return model;
	}
		
	// 로그아웃 처리 - OK
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃 성공");
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 회원가입 페이지 처리 - OK  
	@GetMapping("/enroll")
	public String enrollPage() {
		log.info ("회원가입 페이지 요청");
		
		return "member/enroll";
	}
	
	// 회원가입 처리 - OK
	@PostMapping("/enroll")
	public ModelAndView enroll(HttpSession session,
								ModelAndView model, 
								@ModelAttribute Member member, 
								@ModelAttribute Pet pet, 
								@ModelAttribute Seller seller) {
		int result = 0;
		
		member.setPet(pet);
		member.setSeller(seller);
				
		result = service.saveMember(member);

		if(result > 0) {
			// 단순 로그인했을 때 가입완료 페이지접근 X - 테스트 완료
			String enrollMemName = member.getUserName();
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
	
	// 회원가입 완료 페이지 처리 - OK
	@GetMapping("/enrollFinish")
	public String enrollFinishPage() {
		// 단순 로그인했을 때 접근 X - 테스트 완료
		log.info ("회원가입 완료 페이지 요청");

		return "member/enrollFinish";
	}
	
	// 아이디 중복 체크 - OK
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(ModelAndView model, 
						  @RequestParam String userId) {
		int result = service.idCheck(userId);
		
		if(result != 0) {
			// 중복 아이디 O
			return "fail";
		} else {
			// 중복 아이디 X
			return "success";
		}
	}
	
	// 이메일 중복 체크 - OK
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(ModelAndView model, 
							 @RequestParam String userEmail) {
		int result = service.emailCheck(userEmail);
		
		if(result != 0) {
			// 중복 이메일 O			
			return "fail";
		} else {
			// 중복 이메일 X
			return "success";
		}
	}
	
	// 아이디 찾기 - 페이지 처리 - OK
	@GetMapping("/findMyIdPage")
	public String findMyIdPage() {
		log.info ("아이디 찾기 페이지 요청");
		
		return "member/findMyId";
	}

	// 아이디 찾기 - 이메일 보내기
	@GetMapping("/findMyIdEmailCheck")
	@ResponseBody
	public String findMyIdEmailCheck(@RequestParam String userName, 
									 @RequestParam String userEmail) {

		System.out.println("이메일 보내기 인증 버튼 클릭 !");

		int result = 0;
		
		Member member = service.findByEmail(userEmail);
		
		if(member != null) {
			Random r = new Random();
			int findNum = r.nextInt(999999); // 랜덤난수설정
			
			System.out.println("인증번호 : " + findNum);
			
			if (member.getUserName().equals(userName)) {
				String userId = member.getUserId();
				
				result = service.updateFindNum(userId, findNum);
				
				String setfrom = "petkage_final@naver.com"; // naver 
				String tomail = userEmail; //받는사람
				String title = "[Petkage] 아이디 찾기 인증 이메일 입니다"; 
				String content = System.getProperty("line.separator") 
								+ "안녕하세요 " + member.getUserName() + "회원님" 
								+ System.getProperty("line.separator")
								+ System.getProperty("line.separator")
								+ "[Petkage] 아이디 찾기 인증번호는 " + findNum + " 입니다." 
								+ System.getProperty("line.separator")
								+ System.getProperty("line.separator")
								+ "이 메일은 발신 전용 이메일 입니다. "
								+ System.getProperty("line.separator"); 
				
//				try {
//					MimeMessage message = mailSender.createMimeMessage();
//					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//	
//					messageHelper.setFrom(setfrom); 
//					messageHelper.setTo(tomail); 
//					messageHelper.setSubject(title);
//					messageHelper.setText(content); 
//	
//					mailSender.send(message);
//					
//					} catch (Exception e) {
//						System.out.println(e.getMessage());
//					}

				return "success";
				
			} else {
				
				return "userName fail";
			}
		
		} else {
			
			return "member fail";
		}
		
	}
		
	// 아이디 찾기 - 완료 페이지 처리 - OK
	@GetMapping("/findMyIdFinishPage")
	public String findMyIdFinishPage() {
		
		log.info ("아이디 찾기 완료 페이지 처리");

		return "member/findMyId_Finish";
	}
	
	// 비밀번호 찾기 - 페이지 처리 - OK
	@GetMapping("/findMyPwdPage")
	public String findMyPwdPage() {
		log.info ("비밀번호 찾기 페이지 요청");
		
		return "member/findMyPwd";
	}
	
	// 비밀번호 찾기 - 이메일 보내기 
	@GetMapping("/findMyPwdEmailCheck")
	@ResponseBody
	public String findMyPwdEmailCheck(@RequestParam String userId, 
									  @RequestParam String userEmail) {

		System.out.println("이메일 보내기 인증 버튼 클릭 !");
		
		int result = 0;
		
		Member member = service.findByEmail(userEmail);
		
		if(member != null) {
			Random r = new Random();
			int findNum = r.nextInt(999999); // 랜덤난수설정
						
			System.out.println("인증번호 : " + findNum);
			
			if (member.getUserId().equals(userId)) {			
				result = service.updateFindNum(userId, findNum);
				
				String setfrom = "petkage_final@naver.com"; // naver 
				String tomail = userEmail; //받는사람
				String title = "[Petkage] 비밀번호 변경 인증 이메일 입니다"; 
				String content = System.getProperty("line.separator") 
								+ "안녕하세요 " + member.getUserName() + "회원님" 
								+ System.getProperty("line.separator")
								+ System.getProperty("line.separator")
								+ "[Petkage] 비밀번호 변경 인증번호는 " + findNum + " 입니다." 
								+ System.getProperty("line.separator")
								+ System.getProperty("line.separator")
								+ "이 메일은 발신 전용 이메일 입니다. "
								+ System.getProperty("line.separator"); 
	
//				try {
//					MimeMessage message = mailSender.createMimeMessage();
//					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//	
//					messageHelper.setFrom(setfrom); 
//					messageHelper.setTo(tomail); 
//					messageHelper.setSubject(title);
//					messageHelper.setText(content); 
//	
//					mailSender.send(message);
//					
//					} catch (Exception e) {
//						System.out.println(e.getMessage());
//					}

				return "success";
				
			} else {
				
				return "userId fail";
			}
		
		} else {
			
			return "member fail";
		}
		
	}
	
	// 아이디 & 비밀번호 찾기 - 인증번호 일치 여부 확인
	@GetMapping("/findNumCheck")
	@ResponseBody
	public String findNumCheck(HttpSession session,
							   @RequestParam("userEmail") String userEmail,
							   @RequestParam("inputFindNum") int inputFindNum) {
		String result = null;
		Member saveMember = service.findByEmail(userEmail);
		
		if(saveMember.getFindNum() == inputFindNum) {
			session.setAttribute("saveMember", saveMember);
			
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 비밀번호 찾기 - 비밀번호 변경 페이지 처리
	@GetMapping("/findMyPwdFinishPage")
	public String findMyPwdFinishPage() {
		
		log.info ("비밀번호 변경 페이지 처리");

		return "member/findMyPwd_Finish";
	}
	
	// 비밀번호 찾기 - 비밀번호 변경 
	@PostMapping("/updateFindPwd")
	@ResponseBody
	public String updateFindPwd(@SessionAttribute("saveMember") Member saveMember,
		  					    @RequestParam String newPwd, 
	  						    @RequestParam String newPwdCheck) {
		
		int result = 0;
				
		// 세션에 저장된 멤버가 존재 할 경우
		if(saveMember != null) {
			// 비밀번호가 일치 할 경우
			if(newPwd.equals(newPwdCheck)) {
				int no = saveMember.getNo();
				result = service.updatePwd(no, newPwd);
				
				if(result > 0) {
					return "success";
				} else {
					return "fail";
				}
				
			} else {
				// 비밀번호가 일치하지 않을 경우
				return "pwd fail";
			}
		// 세션에 저장된 멤버가 존재하지 않을 경우
		} else {
			return "member fail";
		}
	}
	
	@PostMapping("/kakaoApi")
	@ResponseBody
	public String kakaoApi() {
		System.out.println("kakaoApi");
		
		return "5b193b0622a9f557a7fdcc91e98cd2d0";
	}
	
	@PostMapping("/kakaoLoginPro")
	@ResponseBody
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap,HttpSession session) {
		System.out.println("paramMap:" + paramMap);
		
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		return resultMap;
	}
}

