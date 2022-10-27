package com.finalproject.petkage.review.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.service.ReviewService;
import com.finalproject.petkage.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
@SessionAttributes("loginMember")
public class ReviewController {

	@Autowired
	private ReviewService service;
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	@GetMapping("/review_list")
    public ModelAndView all_list(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount(), 10);
        review = service.getReviewList(pageInfo);
        
        System.out.println(review);
        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_board");

        System.out.println(review);
        
        return model;

    }
	
	@GetMapping("/review_cafe")
    public ModelAndView review_cafe(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_cafe(), 10);
        review = service.getReviewList_cafe(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_cafe");

        System.out.println(review);
        
        return model;

    }
	
	@GetMapping("/review_food")
    public ModelAndView review_food(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_food(), 10);
        review = service.getReviewList_food(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_food");

        System.out.println(review);
        
        return model;

    }
	
	@GetMapping("/review_hair")
    public ModelAndView review_hair(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_hair(), 10);
        review = service.getReviewList_hair(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_hair");

        System.out.println(review);
        
        return model;

    }
	
	@GetMapping("/review_trip")
    public ModelAndView review_trip(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_trip(), 10);
        review = service.getReviewList_trip(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_trip");

        System.out.println(review);
        
        return model;

    }
	
	@GetMapping("/review_hospital")
    public ModelAndView review_hospital(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_hospital(), 10);
        review = service.getReviewList_hospital(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_hospital");

        System.out.println(review);
        
        return model;
    }
	
	@GetMapping("/review_preschool")
    public ModelAndView review_preschool(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_preschool(), 10);
        review = service.getReviewList_preschool(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_preschool");

        System.out.println(review);
        
        return model;
    }
	
	@GetMapping("/review_bath")
    public ModelAndView review_bath(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.getReviewAllCount_bath(), 10);
        review = service.getReviewList_bath(pageInfo);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_bath");

        System.out.println(review);
        
        return model;
    }
	
	
	
	@GetMapping("/review_write")
    public String Review_write() {
        log.info("게시글 작성 페이지 요청");
        return "wherego/wherego_review_write";
    }
	
	@PostMapping("/review_write")
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
		result = service.review_fupload(review);
		
		
		// 게시글 관련 DB 저장
		
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/review/review_list");
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "./");
		}
		model.setViewName("common/msg");
		System.out.println(result);
		return model;
		
	}
	
	
	@GetMapping("/review_search")
    public ModelAndView review_search(ModelAndView model, 
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "review_search") String search) {
        List<Review> review = null;
        PageInfo pageInfo = null;

        pageInfo = new PageInfo(page, 10, service.search_list(search), 10);
        review = service.search_board(pageInfo, search);
        
        System.out.println(review);

        model.addObject("review", review);
        model.addObject("pageInfo", pageInfo);
        model.setViewName("wherego/wherego_review_board");

        System.out.println(review);
        
        return model;

    }
	
}
