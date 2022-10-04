package com.finalproject.petkage.market.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.MultipartFileUtil;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired 
	private MarketService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("product-write")
	public String write() {
		
		log.info("게시글 작성 페이지 요청");
		
		return "market/product-write";
	}
	
	@PostMapping("/product-write")
	public ModelAndView write(
						 ModelAndView model,
						 @ModelAttribute Product product,
						 @RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
		log.info("Upfile is Empty : {}", upfile.isEmpty());
		log.info("Upfile Name : {}", upfile.getOriginalFilename());
		
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
		
		product.setProSelNo(1);
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
	public ModelAndView List(ModelAndView model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getProductCount(), 8);
		list = service.getProductList(pageInfo);
		System.out.println(list);
		System.out.println(pageInfo);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("market/product-list");
		
		return model;
	}
	
	@GetMapping("/product-view")
	public ModelAndView View(ModelAndView model, @RequestParam int proNo ) {

		System.out.println(proNo);
		
		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		model.addObject("product", product);
		
		model.setViewName("market/product-view");
		
		return model;
	}

	@GetMapping("/product-delete")
	public ModelAndView Delete(ModelAndView model, @RequestParam int proNo) {
		
		int result = 0;
		
		result = service.delete(proNo);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/market/product-list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패했습니다.");
			model.addObject("location", "/market/product-view?no=" + proNo);
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/product-update")
	public ModelAndView Update(ModelAndView model, @RequestParam int proNo) {

		log.info("{}", proNo);

		Product product = null;
		
		product = service.findProductByNo(proNo);
		
		model.addObject("product", product);
		model.setViewName("market/product-update");
		
		return model;
	}
	
	@PostMapping("/product-update")
	public ModelAndView Update(ModelAndView model, @ModelAttribute Product product, @RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
//		System.out.println(upfile.isEmpty());
//		System.out.println(upfile.getOriginalFilename());
		
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
		
		product.setProSelNo(1);
		
		System.out.println(product);
		
		model.setViewName("common/msg");
		
		return model;
	}
}
