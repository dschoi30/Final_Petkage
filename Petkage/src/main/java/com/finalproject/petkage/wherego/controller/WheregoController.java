package com.finalproject.petkage.wherego.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.SessionAttributes;
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
@SessionAttributes("loginMember")
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
	
	
	@GetMapping("/lodging_write")
	public String lodging_write() {
	    log.info("숙소 게시글 작성 페이지 요청");
		return "wherego/wherego_manager_1";
	}
	
	@PostMapping("/lodging_write")
    public ModelAndView lodging_write(
                        ModelAndView model,
                        @RequestParam(value="multiFile") List<MultipartFile> multiFileList, HttpServletRequest request,
                        @ModelAttribute Wherego wherego) {
        int result = 0;
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
                    String img = multiFileList.get(i).getOriginalFilename();
                    System.out.println("이미지" + img);
                    
                    String renameimg = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
                            img.substring(img.lastIndexOf("."));
                    int subFileName = Integer.parseInt(renameimg.substring(9, 18)) + i;
                    renameimg = renameimg.substring(0, 9) + subFileName + renameimg.substring(18, renameimg.length());

                    if(i == 0) {
                        map.put("img", img);
                        map.put("renameimg", renameimg);
                    }
                    else {
                        map.put("img", map.get("img") + ", " + img);
                        map.put("renameimg", map.get("renameimg") + ", " + renameimg);
                    }
                    
                }
                
                file1 = map.get("img");
                file2 = map.get("renameimg");
                
                wherego.setImg(file1);
                wherego.setRenameimg(file2);
                
                String[] fileList = map.get("renameimg").split(", ");
                
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
        
        result = service.lodging_fupload(wherego);
        
        // 게시글 관련 DB 저장
        if(result > 0) {
            model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
            model.addObject("location", "/lodging");
        } else {
            model.addObject("msg", "게시글 등록을 실패하였습니다.");
            model.addObject("location", "./");
        }
        model.setViewName("common/msg");
        System.out.println(result);
        return model;
    }
	
	@GetMapping("/manager2")
	public String manager2() {
		
		return "wherego/wherego_manager_2";
	}
	
	@GetMapping("/search_list")
	public String search_list() {
		
		return "wherego/wherego_search_list";
	}
	
	// lodging 검색 
	
	@GetMapping("/search_list_lod")
    public ModelAndView wherego_search_list(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "all_search") String search) {
        List<Wherego> wherego = null;
        PageInfo pageInfo = null;
        
        pageInfo = new PageInfo(page, 10, service.search_list_lod(search), 10);
        wherego = service.search_board_lod(pageInfo, search);
        
        System.out.println(wherego);

        model.addObject("wherego", wherego);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_search_list");

        System.out.println(wherego);
        
        return model;

    }
	
	
	// 찜 
	
	@GetMapping("/wherego_like")
	public String Wherego_like() {
		
		return "mypage/mypage_heart";
	}
	
	
}
