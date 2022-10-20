package com.finalproject.petkage.market.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.MultipartFileUtil;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.KakaoPayService;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.KakaoPayReady;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.service.MemberService;
import com.finalproject.petkage.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired 
	private MarketService service;

	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/product-write")
	public String write() {
		
		log.info("게시글 작성 페이지 요청");
		
		return "market/product-write";
	}
	
	@PostMapping("/product-write")
	public ModelAndView write(
						 ModelAndView model,
						 @ModelAttribute Product product,
						 @RequestParam("upfile") MultipartFile upfile,
						 @SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
		log.info("Upfile is Empty : {}", upfile.isEmpty());
		log.info("Upfile Name : {}", upfile.getOriginalFilename());
		
		// 파일 업로드 여부 확인 후 저장
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/market").getFile().getPath();
				
				if(product.getRenamedFileName() != null) {
					MultipartFileUtil.delete(location + "/" + product.getRenamedFileName());
				}
				
				renamedFileName = MultipartFileUtil.save(upfile, location);
				
				System.out.println(location);

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				product.setRenamedFileName(renamedFileName);
			}
			
		}
		// 작성 내용을 DB에 저장
		product.setProSelNo(loginMember.getNo());
		System.out.println(product);
		
		result = service.save(product);
		
		if(result > 0) {
			model.addObject("msg", "상품이 정상적으로 등록되었습니다.");
			model.addObject("location", "/market/product-view?proNo=" + product.getProNo());
		} else {
			model.addObject("msg", "상품 등록에 실패했습니다.");
			model.addObject("location", "/market/product-write");
		}
		
		model.setViewName("common/msg");
		
		
		return model;
	}
	
	@GetMapping("/product-list")
	public ModelAndView list(ModelAndView model, 
							@RequestParam(value = "page", defaultValue = "1") int page,
							@ModelAttribute Product product) {

//		log.info("{}", searchValue);

		List<Product> list = null;
//		List<Product> searchList = null;
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 5, service.getProductCount(), 8);
		list = service.getProductList(pageInfo, product);
//		searchList = service.getProductSearchList(pageInfo, searchValue);
//		System.out.println(searchList);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
//		model.addObject("searchValue", searchValue);
		model.setViewName("market/product-list");
		
		return model;
	}
	
	@GetMapping("/product-view")
	public ModelAndView view(ModelAndView model, @RequestParam int proNo ) {

		System.out.println(proNo);
		
		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		model.addObject("product", product);
		
		model.setViewName("market/product-view");
		
		return model;
	}

	@GetMapping("/product-delete")
	public ModelAndView delete(ModelAndView model, 
							@SessionAttribute("loginMember") Member loginMember, 
							@RequestParam int proNo) {
		int result = 0;
		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		if(product.getProSelNo() == (loginMember.getNo())) {
			result = service.delete(proNo);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/market/product-list");
			} else {
				model.addObject("msg", "게시글 삭제에 실패했습니다.");
				model.addObject("location", "/market/product-view?proNo=" + proNo);
			}
			
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/market/product-list");
		}
		
		

		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/product-update")
	public ModelAndView update(ModelAndView model, @RequestParam int proNo, @SessionAttribute("loginMember") Member loginMember) {

		log.info("{}", proNo);

		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		if(product.getProSelNo() == (loginMember.getNo())) {
			model.addObject("product", product);
			model.setViewName("market/product-update");
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/market/product-list");
			model.setViewName("common/msg");
		}
		return model;
	}
	
	@PostMapping("/product-update")
	public ModelAndView update(ModelAndView model,
							@ModelAttribute Product product, 
							@RequestParam("upfile") MultipartFile upfile,
							@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
//		System.out.println(upfile.isEmpty());
//		System.out.println(upfile.getOriginalFilename());
		
		if(service.findProductByNo(product.getProNo()).getProSelNo() == (loginMember.getNo())) {			
			if(upfile != null && !upfile.isEmpty()) {
	
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/market").getFile().getPath();
					renamedFileName = MultipartFileUtil.save(upfile, location);
	
					if(renamedFileName != null) {
						product.setRenamedFileName(renamedFileName);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			result = service.save(product);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/market/product-view?proNo=" + product.getProNo());
			} else {
				model.addObject("msg", "게시글 수정에 실패했습니다.");
				model.addObject("location", "/market/product-update?proNo=" + product.getProNo());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/list");
		}

		System.out.println(product);
		
		model.setViewName("common/msg");
		
		return model;
	}

	@PostMapping("/cart/add")
	@ResponseBody
	public String addCart(@ModelAttribute Cart cart) {
		int result = 0;
		
		System.out.println(cart);
		result = service.addCart(cart);
		System.out.println(result);
		return result + "";
	}
		
	@PostMapping("/cart/delete")
	public String deleteCart(@ModelAttribute Cart cart) {
		service.deleteCart(cart.getCartNo());
		
		return "redirect:/market/cart/" + cart.getNo();
	}

	@PostMapping("/cart/update")
	public String updateCart(@ModelAttribute Cart cart) {
		service.updateCart(cart);
		
		return "redirect:/market/cart/" + cart.getNo();
	}
	
	@GetMapping("/cart/{no}")
	public ModelAndView Cart (ModelAndView model, @ModelAttribute Cart cart, @PathVariable("no") int no) {

		List<Cart> list = service.getCartList(no);
		
		System.out.println(list);
		model.addObject("list", list);
		model.setViewName("market/cart");
		
		return model;
	}
	
	@GetMapping("/order/{no}")
	public ModelAndView Payment (ModelAndView model, @ModelAttribute KakaoPayReady kakaoPayReady, @PathVariable("no") int no) {

		System.out.println("loginMember : " + no);
		System.out.println("orderList : " + kakaoPayReady.getOrders());

		model.addObject("orderList", kakaoPayService.getItemsInfo(kakaoPayReady.getOrders()));
		model.addObject("memberInfo", kakaoPayService.getMemberInfo(no));
		
		model.setViewName("market/order");
		
		return model;
	}
	
	@PostMapping("/order")
	public String Payment(KakaoPayReady kakaoPayReady) {
		log.info("결제 준비 PostMapping");
		
		System.out.println("주문페이지 진입 : " + kakaoPayReady);
		
//		kakaoPayService.setOrder(kakaoPayReady);
		
		return "redirect:" + kakaoPayService.kakaoPayReady(kakaoPayReady);
	}

	@GetMapping("/order-finished")
	public ModelAndView PaymentFinished (@RequestParam("pg_token") String pg_token, ModelAndView model) {
		log.info("결제 성공 GetMapping");
		log.info("pg_token : {}", pg_token);
        model.addObject("info", kakaoPayService.kakaoPayInfo(pg_token));
		model.setViewName("market/order-finished");
		
		return model;
	}
}
