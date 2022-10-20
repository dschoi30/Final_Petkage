package com.finalproject.petkage.wherego.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.MultipartFileUtil;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.controller.MarketController;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.service.ReviewService;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.service.WheregoService;
import com.finalproject.petkage.wherego.model.vo.Wherego;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WheregoController {
	@Autowired
	private WheregoService service;
	
	@Autowired
	private ReviewService review_service;
	
	@Autowired
    private ResourceLoader resourceLoader;
	
	
	@GetMapping("/main")
    public ModelAndView review_all(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, review_service.getReviewAllCount_review_all(), 10);
        review = review_service.getReviewList_review_all(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_main");

        System.out.println("담기전" + review);
        
        return model;

    }
	
	@GetMapping("/cafedetail")
	public String cafedetail() {
		
		return "wherego/wherego_cafe_detail";
	}
	
	@GetMapping("/cafe")
	public ModelAndView cafe(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.cafe_board(); 
		
		model.addObject("cafeselect", wherego);
		model.setViewName("wherego/wherego_cafe");
		
		return model;
	}
	
	@GetMapping("/lodging")
	public ModelAndView lodging(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.lodging_board(); 
		
		model.addObject("lodgingselect", wherego);
		model.setViewName("wherego/wherego_lodging");
		
		return model;
	}
	
	@GetMapping("/lodgingdetail")
	public String lodgingdetail() {
		
		return "wherego/wherego_lodging_detail";
	}
	
	@GetMapping("/food")
	public ModelAndView food(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.food_board(); 
		
		model.addObject("foodselect", wherego);
		model.setViewName("wherego/wherego_food");
		
		return model;
	}
	
	@GetMapping("/fooddetail")
	public String fooddetail() {
		
		return "wherego/wherego_food_detail";
	}
	
	@GetMapping("/hair")
	public ModelAndView hair(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.hair_board(); 
		
		model.addObject("hairselect", wherego);
		model.setViewName("wherego/wherego_hair");
		
		return model;
	}
	
	@GetMapping("/hairdetail")
	public String hairdetail() {
		
		return "wherego/wherego_hair_detail";
	}
	
	@GetMapping("/trip")
	public ModelAndView trip(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.trip_board(); 
		
		model.addObject("tripselect", wherego);
		model.setViewName("wherego/wherego_trip");
		
		return model;
	}
	
	@GetMapping("/tripdetail")
	public String tripdetail() {
		
		return "wherego/wherego_trip_detail";
	}
	
	@GetMapping("/hospital")
	public ModelAndView hospital(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.hospital_board(); 
		
		model.addObject("hospitalselect", wherego);
		model.setViewName("wherego/wherego_hospital");
		
		return model;
	}
	
	@GetMapping("/hospitaldetail")
	public String hospitaldetail() {
		
		return "wherego/wherego_hospital_detail";
	}
	
	@GetMapping("/preschool")
	public ModelAndView preschool(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.preschool_board(); 
		
		model.addObject("preschoolselect", wherego);
		model.setViewName("wherego/wherego_preschool");
		
		return model;
	}
	
	@GetMapping("/preschooldetail")
	public String preschooldetail() {
		
		return "wherego/wherego_preschool_detail";
	}
	
	@GetMapping("/bath")
	public ModelAndView bath(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.bath_board(); 
		
		model.addObject("bathselect", wherego);
		model.setViewName("wherego/wherego_bath");
		
		return model;
	}
	
	@GetMapping("/bathdetail")
	public String bathdetail() {
		
		return "wherego/wherego_bath_detail";
	}
	
	@GetMapping("/petsitter")
	public ModelAndView petsitter(ModelAndView model) {
		List<Wherego> wherego = null;
		
		wherego = service.petsitter_board(); 
		
		model.addObject("petsitterselect", wherego);
		model.setViewName("wherego/wherego_petsitter");
		
		return model;
	}
	
	@GetMapping("/petsitterdetail")
	public String petsitterdetail() {
		
		return "wherego/wherego_petsitter_detail";
	}
	
	
	@GetMapping("/reviewboard")
	public String reivewboard() {
		
		return "wherego/wherego_review_board";
	}
	
	@GetMapping("/reviewwrite")
	public String reivewwrite() {
		
		return "wherego/wherego_review_write";
	}
	
	
	@GetMapping("/manager1")
	public String manager1() {
		
		return "wherego/wherego_manager_1";
	}
	
	@PostMapping("/manager1")
    public ModelAndView write(
                         ModelAndView model,
                         @ModelAttribute Wherego wherego ,
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
                location = resourceLoader.getResource("resources/upload/wherego").getFile().getPath();
                
                if(wherego.getRenamedFileName() != null) {
                    MultipartFileUtil.delete(location + "/" + wherego.getRenamedFileName());
                }
                
                renamedFileName = MultipartFileUtil.save(upfile, location);
                
                System.out.println(location);

            } catch (IOException e) {
                e.printStackTrace();
            }
            
            if(renamedFileName != null) {
                wherego.setRenamedFileName(renamedFileName);
            }
            
        }
        // 작성 내용을 DB에 저장
        wherego.setSpotNo(loginMember.getNo());
        System.out.println(wherego);
        
        result = service.save(wherego);
        
        if(result > 0) {
            model.addObject("msg", "상품이 정상적으로 등록되었습니다.");
            model.addObject("location", "/manager1?proNo=" + wherego.getSpotNo());
        } else {
            model.addObject("msg", "상품 등록에 실패했습니다.");
            model.addObject("location", "/manager1");
        }
        
        model.setViewName("common/msg");
        
        
        return model;
    }
	
	@GetMapping("/manager2")
	public String manager2() {
		
		return "wherego/wherego_manager_2";
	}
	
	// lodging 검색 
	
	@GetMapping("/wherego_search_lod")
    public ModelAndView wherego_search_lod(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "review_search") String search) {
        List<Wherego> wherego = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.search_list_lod(search), 10);
        wherego = service.search_board_lod(pageInfo, search);
        
        System.out.println(wherego);

        model.addObject("wherego", wherego);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_lodging");

        System.out.println(wherego);
        
        return model;

    }
	
	
}
