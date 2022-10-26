package com.finalproject.petkage.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.mapper.MarketMapper;
import com.finalproject.petkage.market.model.vo.PayItems;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.mypage.model.mapper.MyPageMapper;
import com.finalproject.petkage.mypage.model.service.MyPageService;
import com.finalproject.petkage.mypage.model.vo.Order;
import com.finalproject.petkage.review.model.vo.Review;

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
	
	
	@GetMapping("/myPage_heart")
	public String myPageHeart() {
		
		return "mypage/myPage_heart";
	}
	
//	@GetMapping("/myPage_reviewAble")
//	public String myPageReviewAble() {
//		
//		return "mypage/myPage_reviewAble";
//	}
	
//	@GetMapping("/myPage_wroteReviews")
//	public String myPagewroteReviews() {
//		
//		return "mypage/myPage_wroteReviews";
//	}
	
//	@GetMapping("/myPage_productReview")
//	public String myPageProductReview() {
//		
//		return "mypage/myPage_productReview";
//	}
	
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
		
		@GetMapping("/myPage_reviewAble")
	    public ModelAndView ReviewAble_list(ModelAndView model, @SessionAttribute("loginMember") Member loginMember, @RequestParam int payItemNo,
	            @RequestParam(value = "page", defaultValue = "1") int page) {
//			Payment paymentreview = MarketMapper.get(no);
	        List<Payment> payment = null;
//	        List<Review> review = null;
	        PageInfo pageInfo = null;
	        Review pdreview = new Review();
	        PayItems payItems = null;
	        Product product = null;


	        pageInfo = new PageInfo(page, 10, service.getOrderAllCount(), 10);
	        payment = service.getOrderList(pageInfo, loginMember.getNo());
//	        product = service.findRwProductByNo(proNo);
	        payItems = service.getPayNoName(payItemNo);
//	        review = service.getWhReviewList(pageInfo);
	        
	        System.out.println(payment);
	        System.out.println(payItems);
//	        System.out.println(review);
	        
//	        model.addObject("review", review);
	        model.addObject("product", product);
	        model.addObject("pdreview", pdreview);
	        model.addObject("payItems", payItems);
	        model.addObject("payment", payment);
	        model.addObject("pageInfo", pageInfo);
	        model.setViewName("mypage/myPage_reviewAble");

	        System.out.println(payment);
//	        System.out.println(review);
	        
	        return model;

	    }
		
		@GetMapping("/myPage_wroteReviews")
	    public ModelAndView WroteReview_list(@SessionAttribute("loginMember") Member loginMember, ModelAndView model, 
	            @RequestParam(value = "page", defaultValue = "1") int page) {
//	        List<Payment> payment = null;
	        List<Review> review = null;
	        PageInfo pageInfo = null;



	        pageInfo = new PageInfo(page, 10, service.getPdReviewAllCount(), 10);
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
		
//		/* 리뷰 쓰기 */
//		@GetMapping("/myPage_productReview/{no}")
//		public String replyEnrollWindowGET(@PathVariable("no")int no, int payItemNo, Model model) {
//			Payment paymentInfo = service.getPayNoName(payItemNo);
//			model.addAttribute("paymentInfo", paymentInfo);
//			model.addAttribute("no", no);
//			System.out.println(payItemNo);
//			
//			return "mypage/myPage_productReview";
//		}
		
		@GetMapping("/myPage_productReview")
	    public String Review_write() {
	        log.info("게시글 작성 페이지 요청");
	        return "mypage/myPage_productReview";
	    }
		
		@PostMapping("/myPage_productReview")
		public ModelAndView Review_write(
							ModelAndView model,
							@RequestParam(value="multiFile") List<MultipartFile> multiFileList,HttpServletRequest request,
							@ModelAttribute Review review,
							@SessionAttribute("loginMember") Member loginMember) {

			
			
			
			int result = 0;
			
			
			System.out.println(loginMember);
			
			// 받아온것 출력 확인
					System.out.println("multiFileList : " + multiFileList);

					// path 가져오기
					String path = request.getSession().getServletContext().getRealPath("resources");
					String root = path + "\\" + "uploadFiles";
					
					File fileCheck = new File(root);
					
					if(!fileCheck.exists()) fileCheck.mkdirs();
					
					String file1 = "";
					String file2 = "";
					
					Map<String, String> map = new HashMap<>();
					
					for(int i = 0; i < multiFileList.size(); i++) {
						String revimg = multiFileList.get(i).getOriginalFilename();
						
						String revrenameimg = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
								revimg.substring(revimg.lastIndexOf("."));
						int subFileName = Integer.parseInt(revrenameimg.substring(9, 18)) + i;
						revrenameimg = revrenameimg.substring(0, 9) + subFileName + revrenameimg.substring(18, revrenameimg.length());

						if(i == 0) {
			                map.put("revimg", revimg);
			                map.put("revrenameimg", revrenameimg);
			            }
			            else {
			                map.put("revimg", map.get("revimg") + ", " + revimg);
			                map.put("revrenameimg", map.get("revrenameimg") + ", " + revrenameimg);
			            }
						
					}
					
					file1 = map.get("revimg");
					file2 = map.get("revrenameimg");
					
					review.setRevimg(file1);
					review.setRevrenameimg(file2);
					
					String[] fileList = map.get("revrenameimg").split(", ");
					
					try {
						for(int i = 0; i < multiFileList.size(); i++) {
							File uploadFile = new File(root + "\\" + fileList[i]);
							multiFileList.get(i).transferTo(uploadFile);
						}
						System.out.println("다중 파일 업로드 성공!");
						System.out.println("파일" + multiFileList);
						
					} catch (IllegalStateException | IOException e) {
						System.out.println("다중 파일 업로드 실패 ㅠㅠ");
						// 만약 업로드 실패하면 파일 삭제
						for(int i = 0; i < multiFileList.size(); i++) {
							new File(root + "\\" + fileList[i]).delete();
						}
						e.printStackTrace();
					}
			review.setWriterno(loginMember.getNo());
			result = service.pdreview_fupload(review);
			
			
			// 게시글 관련 DB 저장
			
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/review_list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "./");
			}
			model.setViewName("common/msg");
			System.out.println(result);
			return model;
			
		}
	
//		@GetMapping("/myPage_wroteReviews")
//	    public ModelAndView WhReview_list(ModelAndView model, 
//	            @RequestParam(value = "page", defaultValue = "1") int page) {
//	        List<Review> review = null;
//	        PageInfo pageInfo = null;
//
//	        pageInfo = new PageInfo(page, 10, service.getWhReviewAllCount(), 10);
//	        review = service.getWhReviewList(pageInfo);
//	        
//	        System.out.println(review);
//
//	        model.addObject("review", review);
//	        model.addObject("pageInfo", pageInfo);
//	        model.setViewName("mypage/myPage_wroteReviews");
//
//	        System.out.println(review);
//	        
//	        return model;
//
//	    }
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
