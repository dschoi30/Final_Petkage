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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.service.ReviewService;
import com.finalproject.petkage.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
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
	
	@GetMapping("/review_write")
    public String Review_write() {
        log.info("게시글 작성 페이지 요청");
        return "wherego/review_write";
    }
	
	@PostMapping("/review_write")
	public ModelAndView Review_write(
						ModelAndView model,
						@RequestParam(value="multiFile") List<MultipartFile> multiFileList,HttpServletRequest request,
						@ModelAttribute Review review) {
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
		
		result = service.review_fupload(review);
		
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
	
	
}