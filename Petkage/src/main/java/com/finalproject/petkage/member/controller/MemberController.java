package com.finalproject.petkage.member.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.util.MapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.petkage.member.model.service.MemberService;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.member.model.vo.NaverLoginBO;
import com.finalproject.petkage.member.model.vo.Pet;
import com.finalproject.petkage.member.model.vo.Seller;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.utils.MapUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {

	private static final int String = 0;

	@Autowired
	private MemberService service;
	
	@Autowired
    private JavaMailSender mailSender;
			
	// 로그인 - 페이지 요청
	@GetMapping("/loginPage")
	public String loginPage(Model model,HttpSession session) {
		log.info("로그인 페이지 요청");
		
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("네이버: " + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
		return "member/login";
	}
	
	// 로그인 - enrollType [Petkage] 요청
	@PostMapping("/login")
	public ModelAndView login(HttpSession session, 
							  ModelAndView model, 
							  @RequestParam String userId, 
							  @RequestParam String userPwd) {
		log.info("{}, {}", userId, userPwd);

		Member loginMember = service.login(userId, userPwd);
		System.out.println(loginMember);
		
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
		return model;
	}
		
	// 로그아웃 - 요청
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃 성공");
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 회원가입 - 페이지 요청  
	@GetMapping("/enroll")
	public String enrollPage() {
		log.info ("회원가입 페이지 요청");
		
		return "member/enroll";
	}
	
	// 회원가입 - 요청
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
			
			model.addObject("msg", "[Petkage] 당신의 Petkage를 시작하세요.");
			model.addObject("location", "/member/enrollFinish");
		} else {
			model.addObject("msg", "[Petkage] 회원가입에 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 회원가입 - 완료 페이지 요청
	@GetMapping("/enrollFinish")
	public String enrollFinishPage() {
		// 단순 로그인했을 때 접근 X - 테스트 완료
		log.info ("회원가입 완료 페이지 요청");

		return "member/enrollFinish";
	}
	
	// 회원가입 - 아이디 중복 체크
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
	
	// 회원가입 - 이메일 중복 체크
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
	
	// 아이디 찾기 - 페이지 요청
	@GetMapping("/findMyIdPage")
	public String findMyIdPage() {
		log.info ("아이디 찾기 페이지 요청");
		
		return "member/findMyId";
	}

	// 아이디 찾기 - 이메일 요청 ▶ 이메일 내용 수정하기
	@GetMapping("/findMyIdEmailCheck")
	@ResponseBody
	public String findMyIdEmailCheck(@RequestParam String userName, 
									 @RequestParam String userEmail) {

		System.out.println("이메일 보내기 인증 버튼 클릭");
		
		Member member = service.findByEmail(userEmail);
		
		if(member != null) {
			Random r = new Random();
			int findNum = r.nextInt(999999); // 랜덤난수설정
			
			System.out.println("인증번호 : " + findNum);
			
			if (member.getUserName().equals(userName)) {
				String userId = member.getUserId();
				
				int result = service.updateFindNum(userId, findNum);
				
				String setfrom = "petkage_final@naver.com"; // naver 
				String tomail = userEmail; //받는사람
				String title = "[Petkage] 아이디 찾기 인증 이메일 입니다"; 
				String content = "<html lang=\"ko\">\r\n"
						+ "  <head>\r\n"
						+ "    <meta charset=\"UTF-8\" />\r\n"
						+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n"
						+ "    <title>Document</title>\r\n"
						+ "    <style>\r\n"
						+ "      @font-face {\r\n"
						+ "        font-family: \"GmarketSansMedium\";\r\n"
						+ "        src: url(\"https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff\")\r\n"
						+ "          format(\"woff\");\r\n"
						+ "        font-weight: normal;\r\n"
						+ "        font-style: normal;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      * {\r\n"
						+ "        font-family: \"GmarketSansMedium\";\r\n"
						+ "        color: black;\r\n"
						+ "      }\r\n"
						+ "    </style>\r\n"
						+ "  </head>\r\n"
						+ "  <body>\r\n"
						+ "    <div style=\"text-align: center\">\r\n"
						+ "      <div style=\"width: 80em; border: 6px solid #753422; border-radius: 20px; margin: auto\">\r\n"
						+ "        <div>\r\n"
						+ "          <img\r\n"
						+ "            src=\"https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F5yVaE%2FbtrPvvoMtMy%2FTOwQlUU3EjeyDr5a3LZZNK%2Fimg.png\"\r\n"
						+ "            style=\"width: 350px; height: 140px\"\r\n"
						+ "          />\r\n"
						+ "        </div>\r\n"
						+ "\r\n"
						+ "        <div style=\"font-size: 30px; font-weight: 700\">\r\n"
						+ "          당신의 반려동물을 위한 최고의 플랫폼,\r\n"
						+ "          <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>입니다. <br /><br /><br />\r\n"
						+ "        </div>\r\n"
						+ "\r\n"
						+ "        <div style=\"font-size: 20px; font-weight: 700; color: black\">\r\n"
						+ "          "+ member.getUserName() + " 회원님, 안녕하세요. <br /><br />\r\n"
						+ "          이 메일은 인증번호 확인을 위한 이메일입니다. <br />\r\n"
						+ "          혹시, <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>의\r\n"
						+ "          <span style=\"text-decoration: underline\">아이디</span>를\r\n"
						+ "          잊어버리셨나요? <br /><br />\r\n"
						+ "          아래 번호를 인증번호 확인 칸에 입력 후, <br />\r\n"
						+ "          <span style=\"text-decoration: underline\">확인 버튼</span>을 클릭해\r\n"
						+ "          주세요. <br /><br /><br />\r\n"
						+ "          인증번호는 <br /><br />\r\n"
						+ "          <div\r\n"
						+ "            style=\"\r\n"
						+ "              width: 170px;\r\n"
						+ "              border: 6px solid #753422;\r\n"
						+ "              border-top: none;\r\n"
						+ "              border-right: none;\r\n"
						+ "              border-left: none;\r\n"
						+ "              justify-content: center;\r\n"
						+ "              align-content: center;\r\n"
						+ "              margin: auto;\r\n"
						+ "              padding: 15px 0;\r\n"
						+ "              /* display: table-cell;\r\n"
						+ "                vertical-align: middle; */\r\n"
						+ "            \"\r\n"
						+ "          >\r\n"
						+ "            " + findNum + "\r\n"
						+ "          </div>\r\n"
						+ "          <br />\r\n"
						+ "          입니다. <br /><br /><br /><br />\r\n"
						+ "\r\n"
						+ "          여러분의 반려동물 곁에는 언제나 <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>가 함께 합니다.<br /><br /><br /><br />\r\n"
						+ "          <div style=\"font-size: 15px\">\r\n"
						+ "            *본 메일은 발신전용 메일입니다.<br /><br />\r\n"
						+ "          </div>\r\n"
						+ "        </div>\r\n"
						+ "      </div>\r\n"
						+ "    </div>\r\n"
						+ "  </body>\r\n"
						+ "</html>";
				

				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content, true); 
	
					mailSender.send(message);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				return "success";
			} else {
				return "userName fail";
			}
		} else {
			return "member fail";
		}
	}
		
	// 아이디 찾기 - 완료 페이지 요청
	@GetMapping("/findMyIdFinishPage")
	public String findMyIdFinishPage() {
		
		log.info ("아이디 찾기 완료 페이지 처리");

		return "member/findMyId_Finish";
	}
	
	// 비밀번호 찾기 - 페이지 요청
	@GetMapping("/findMyPwdPage")
	public String findMyPwdPage() {
		log.info ("비밀번호 찾기 페이지 요청");
		
		return "member/findMyPwd";
	}
	
	// 비밀번호 찾기 - 이메일 요청 ▶ 이메일 내용 수정하기
	@GetMapping("/findMyPwdEmailCheck")
	@ResponseBody
	public String findMyPwdEmailCheck(@RequestParam String userId, 
									  @RequestParam String userEmail) {

		System.out.println("이메일 보내기 인증 버튼 클릭");
		
		Member member = service.findByEmail(userEmail);
		
		if(member != null) {
			Random r = new Random();
			int findNum = r.nextInt(999999); // 랜덤난수설정
						
			System.out.println("인증번호 : " + findNum);
			
			if (member.getUserId().equals(userId)) {			
				int result = service.updateFindNum(userId, findNum);
				
				String setfrom = "petkage_final@naver.com"; // naver 
				String tomail = userEmail; //받는사람
				String title = "[Petkage] 비밀번호 변경 인증 이메일 입니다"; 
				String content = "<html lang=\"ko\">\r\n"
						+ "  <head>\r\n"
						+ "    <meta charset=\"UTF-8\" />\r\n"
						+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n"
						+ "    <title>Document</title>\r\n"
						+ "        <style>\r\n"
						+ "      @font-face {\r\n"
						+ "        font-family: \"GmarketSansMedium\";\r\n"
						+ "        src: url(\"https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff\")\r\n"
						+ "          format(\"woff\");\r\n"
						+ "        font-weight: normal;\r\n"
						+ "        font-style: normal;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      @import url(\"https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff\");\r\n"
						+ "\r\n"
						+ "      * {\r\n"
						+ "        font-family: \"GmarketSansMedium\";\r\n"
						+ "        color: black;\r\n"
						+ "      }\r\n"
						+ "    </style>\r\n"
						+ "  </head>\r\n"
						+ "  <body>\r\n"
						+ "    <div style=\"text-align: center\">\r\n"
						+ "      <div style=\"width: 80em; border: 6px solid #753422; border-radius: 20px; margin: auto\">\r\n"
						+ "        <div>\r\n"
						+ "          <img\r\n"
						+ "            src=\"https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F5yVaE%2FbtrPvvoMtMy%2FTOwQlUU3EjeyDr5a3LZZNK%2Fimg.png\"\r\n"
						+ "            style=\"width: 350px; height: 140px\"\r\n"
						+ "          />\r\n"
						+ "        </div>\r\n"
						+ "\r\n"
						+ "        <div style=\"font-size: 30px; font-weight: 700\">\r\n"
						+ "          당신의 반려동물을 위한 최고의 플랫폼,\r\n"
						+ "          <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>입니다. <br /><br /><br />\r\n"
						+ "        </div>\r\n"
						+ "\r\n"
						+ "        <div style=\"font-size: 20px; font-weight: 700; color: black\">\r\n"
						+ "          "+ member.getUserName() + " 회원님, 안녕하세요. <br /><br />\r\n"
						+ "          이 메일은 인증번호 확인을 위한 이메일입니다. <br />\r\n"
						+ "          혹시, <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>의\r\n"
						+ "          <span style=\"text-decoration: underline\">비밀번호</span>를\r\n"
						+ "          잊어버리셨나요? <br /><br />\r\n"
						+ "          아래 번호를 인증번호 확인 칸에 입력 후, <br />\r\n"
						+ "          <span style=\"text-decoration: underline\">확인 버튼</span>을 클릭해\r\n"
						+ "          주세요. <br /><br /><br />\r\n"
						+ "          인증번호는 <br /><br />\r\n"
						+ "          <div\r\n"
						+ "            style=\"\r\n"
						+ "              width: 170px;\r\n"
						+ "              border: 6px solid #753422;\r\n"
						+ "              border-top: none;\r\n"
						+ "              border-right: none;\r\n"
						+ "              border-left: none;\r\n"
						+ "              justify-content: center;\r\n"
						+ "              align-content: center;\r\n"
						+ "              margin: auto;\r\n"
						+ "              padding: 15px 0;\r\n"
						+ "              /* display: table-cell;\r\n"
						+ "                vertical-align: middle; */\r\n"
						+ "            \"\r\n"
						+ "          >\r\n"
						+ "            " + findNum + "\r\n"
						+ "          </div>\r\n"
						+ "          <br />\r\n"
						+ "          입니다. <br /><br /><br /><br />\r\n"
						+ "\r\n"
						+ "          여러분의 반려동물 곁에는 언제나 <span style=\"color: #753422\">Pet</span\r\n"
						+ "          ><span style=\"color: #d79771\">kage</span>가 함께 합니다.<br /><br /><br /><br />\r\n"
						+ "          <div style=\"font-size: 15px\">\r\n"
						+ "            *본 메일은 발신전용 메일입니다.<br /><br />\r\n"
						+ "          </div>\r\n"
						+ "        </div>\r\n"
						+ "      </div>\r\n"
						+ "    </div>\r\n"
						+ "  </body>\r\n"
						+ "</html>";
	
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content, true); 
	
					mailSender.send(message);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				return "success";
			} else {
				return "userId fail";
			}
		} else {
			return "member fail";
		}
	}
	
	// 아이디/비밀번호 찾기 - 인증번호 일치 여부 확인
	@GetMapping("/findNumCheck")
	@ResponseBody
	public String findNumCheck(HttpSession session,
							   @RequestParam("userEmail") String userEmail,
							   @RequestParam("inputFindNum") int inputFindNum) {
		Member saveMember = service.findByEmail(userEmail);
		
		if(saveMember.getFindNum() == inputFindNum) {
			session.setAttribute("saveMember", saveMember);
			
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 비밀번호 찾기 - 비밀번호 변경 페이지 요청
	@GetMapping("/findMyPwdFinishPage")
	public String findMyPwdFinishPage() {
		
		log.info ("비밀번호 변경 페이지 요청");

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

	/* KAKAO */
	// KAKAO - 이메일 일치 여부 확인 후 로그인 및 회원가입
	@PostMapping("/kakaoLoginPro")
	@ResponseBody
	public String kakaoLoginPro(HttpSession session,
								@RequestParam String kakao_kakaoId, 
								@RequestParam String kakao_email, 
								@RequestParam String kakao_name) {
		
		log.info("kakaoLoginPro");
		int result = service.emailCheck(kakao_email);

		System.out.println(kakao_email);

		if(result != 0) {
			// 중복 이메일 O	
			return "Kakao_Login";
		} else {
			// 중복 이메일 X 
			return "Kakao_Enroll";
		}
	}
	
	// KAKAO - 회원가입 페이지 요청 
	@GetMapping("/enrollKakaoPage")
	public String enrollKakaoPage() {
		log.info ("회원가입(카카오) 페이지 요청");
		
		return "member/enroll_Kakao";
	}
	
	// KAKAO - 사용자 정보 보내기
	@PostMapping("/setKakaoInfo")
	public ModelAndView setKakaoInfo(ModelAndView model,
								     @RequestParam String kakao_kakaoId, 
								     @RequestParam String kakao_email, 
								     @RequestParam String kakao_name, 
								     @RequestParam String enroll_Type) {
		
		if(kakao_kakaoId != null) {
			
		model.addObject("kakao_kakaoId", kakao_kakaoId);
		model.addObject("kakao_email", kakao_email);
		model.addObject("kakao_name", kakao_name);
		model.addObject("enroll_Type", enroll_Type);
		
		model.setViewName("member/enroll_Kakao");
		} else {
			model.addObject("msg", "[Petkage] 잘못된 접근입니다.");
			model.addObject("location", "/");
		
			model.setViewName("common/msg");
		}
		return model;
	}
	
	// KAKAO - 로그인 요청
	@PostMapping("/login_kakao")
	public ModelAndView loginKakao(HttpSession session, 
							  	   ModelAndView model, 
							  	   @RequestParam("kakaoId") String kakaoId) {
		log.info("kakaoId : " + kakaoId);

		Member loginMember = service.loginByKakao(kakaoId);
		
		System.out.println(loginMember);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			System.out.println(loginMember.getMemberRole());

			if(loginMember.getMemberRole().equals("ROLE_USER")) {
				// 일반 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 일반 회원입니다.");
				model.setViewName("common/msg");
			} else if (loginMember.getMemberRole().equals("ROLE_SELLER")){
				// 판매 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 판매자 회원입니다.");
				model.setViewName("common/msg");
			} else {
				// 관리자 회원 로그인 했을 경우
				model.addObject("msg", "[Petkage] 당신은 Petkage의 관리자입니다.");
				model.setViewName("common/msg");
			}
		} else {
			model.addObject("msg", "[Petkage] 카카오 계정을 확인해 주세요. ");
			model.addObject("location", "/member/loginPage");
			model.setViewName("common/msg");
		}		
		return model;
	}

	/* NAVER */
	// NaverLoginBO
    private NaverLoginBO naverLoginBO;
    
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
 
	// NAVER - 회원가입 페이지 요청 
	@GetMapping("/enrollNaverPage")
	public String enrollNaverPage() {
		log.info ("회원가입(네이버) 페이지 요청");
		
		return "member/enroll_Naver";
	}
	
    // NAVER - 네이버 로그인 성공시 callback 호출 후 사용자 정보 요청
    @RequestMapping(value = "/callbackNaver", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callbackNaver(ModelAndView model,
	    							 @RequestParam Map<String,Object> paramMap,
	    							 @RequestParam String code, 
	    							 @RequestParam String state, 
	    							 HttpSession session) throws IOException {
    	
        log.info("callbackNaver");
        
        System.out.println("paramMap:" + paramMap);
        Map <String, Object> resultMap = new HashMap<String, Object>();
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        
        // 로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println("apiResult : " + apiResult);
        
        ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
        System.out.println("apiJson : " + apiJson);
				
		String naver_name = (String) apiJson.get("name");
		String naver_email = (String) apiJson.get("email");
		String naver_pwd = (String) apiJson.get("id");
		
		int result = service.emailCheck(naver_email);
		
		if(result != 0) {
			// 중복 이메일 o
			Member loginMember = service.loginByNaver(naver_email);
			
			model.addObject("msg", "[Petkage] 네이버로 로그인을 시작합니다.");
			if(loginMember != null) {
				session.setAttribute("loginMember", loginMember);
				System.out.println("loginMember : " + loginMember);
				System.out.println("MeberRole : " + loginMember.getMemberRole());
				
				if(loginMember.getMemberRole().equals("ROLE_USER")) {
					// 일반 회원 로그인 했을 경우
					model.addObject("msg", "[Petkage] 당신은 Petkage의 일반 회원입니다.");
					model.setViewName("common/msg");
				} else if (loginMember.getMemberRole().equals("ROLE_SELLER")){
					// 판매 회원 로그인 했을 경우
					model.addObject("msg", "[Petkage] 당신은 Petkage의 판매자 회원입니다.");
					model.setViewName("common/msg");
				} else {
					// 관리자 회원 로그인 했을 경우
					model.addObject("msg", "[Petkage] 당신은 Petkage의 관리자입니다.");
					model.setViewName("common/msg");
				}
			} else {
				model.addObject("msg", "[Petkage] 네이버 계정을 확인해 주세요. ");
				model.addObject("location", "/member/loginPage");
				model.setViewName("common/msg");
			}
			return model;
		} else {
			// 중복 이메일 x
			Random r = new Random();
			int idNum = r.nextInt(999999); // 랜덤난수설정
			
			String naver_naverId = "naver" + idNum;
			System.out.println("naver_naverId : " + naver_naverId);

			model.addObject("naver_naverId", naver_naverId);
			model.addObject("naver_name", naver_name);
			model.addObject("naver_email", naver_email);
			model.addObject("naver_pwd", naver_pwd);
			
			model.setViewName("member/enroll_Naver");

			return model;
		}
    }


	//로그인(네이버) 처리 - OK
//	@PostMapping("/login_naver")
//	public ModelAndView loginNaver(HttpSession session, 
//							  	   ModelAndView model, 
//							  	   @RequestParam("id") String naverPwd) {
//		log.info("kakaoId : " + naverPwd);
//
//		Member loginMember = service.loginByNaver(naverPwd);
//		
//		System.out.println(loginMember);
//		if(loginMember != null) {
//			session.setAttribute("loginMember", loginMember);
//			model.addObject("msg", "[Petkage] 네이버로 로그인을 시작합니다.");
//			System.out.println(loginMember.getMemberRole());
//			if(loginMember.getMemberRole().equals("ROLE_USER")) {
//				// 일반 회원 로그인 했을 경우
//				model.addObject("msg", "[Petkage] 당신은 Petkage의 일반 회원입니다.");
//				model.setViewName("common/msg");
//			} else if (loginMember.getMemberRole().equals("ROLE_SELLER")){
//				// 판매 회원 로그인 했을 경우
//				model.addObject("msg", "[Petkage] 당신은 Petkage의 판매자 회원입니다.");
//				model.setViewName("common/msg");
//			} else {
//				// 관리자 회원 로그인 했을 경우
//				model.addObject("msg", "[Petkage] 당신은 Petkage의 관리자입니다.");
//				model.setViewName("common/msg");
//			}
//		} else {
//			model.addObject("msg", "[Petkage] 네이버 계정을 확인해 주세요. ");
//			model.addObject("location", "/member/loginPage");
//			model.setViewName("common/msg");
//		}
//		
//		System.out.println(loginMember);
//		
//		return model;
//	}
    
    /* Google */
    
    // Google - 토큰 복호화
    @PostMapping("/googleToken")
    @ResponseBody
    public String googleToken(@RequestParam("googleToken") String googleToken) throws Exception{
    	String token = null;
    	System.out.println("googleToken : " + googleToken);

        Map<String, Object> map = new HashMap<String, Object>();
        String[] params = googleToken.split("&");

        for(String param : params){
            String name = param.split("=")[0];
            String value = param.split("=")[1];
            map.put(name, value);
        }

        System.out.println(params);
//        String token = MapUtils.getString(map, "id_token");
//        String[] check = token.split("\\.");
//        Base64.Decoder decoder = Base64.getDecoder();
//        String payload = new String(decoder.decode(check[1]));
//
//        ObjectMapper mapper = new ObjectMapper();
//        Map<String, Object> returnMap = mapper.readValue(payload, Map.class);
    	return token;
    }
	
	// 회원정보수정
	@GetMapping("/mypage/myPage_userModify")
	public String myPage() {
		log.info("회원 정보 수정 페이지 요청");
		
		return "mypage/myPage_userModify";
	}
	
	@PostMapping("/update")
	public ModelAndView update(
			ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Member member) {	
		
		log.info(member.toString());
		log.info(loginMember.toString());
		
		int result = 0;
		
		member.setNo(loginMember.getNo());

		result = service.saveMember(member);
		
		if(result > 0) {
			model.addObject("loginMember", service.findMemberById(loginMember.getUserId()));
			model.addObject("msg", "회원 정보 수정을 완료했습니다.");
		} else {
			model.addObject("msg", "회원 정보 수정을 실패했습니다.");
		}
		
		model.addObject("location", "/mypage/myPage_userModify");
		model.setViewName("common/msg");
		
		return model;
	}
		
	// 회원 탈퇴
	@GetMapping("/delete")
	public ModelAndView delete(
			ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
		result = service.delete(loginMember.getNo());
		
		if(result > 0) {
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/member/logout");
		} else {
			model.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			model.addObject("location", "/mypage/myPage_userModify");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}