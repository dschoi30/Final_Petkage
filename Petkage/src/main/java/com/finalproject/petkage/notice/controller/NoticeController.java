package com.finalproject.petkage.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.notice.model.service.NoticeService;
import com.finalproject.petkage.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;

	@GetMapping("/noticeList")
	public ModelAndView noticeList(ModelAndView model,
					@RequestParam(value ="page", defaultValue = "1") int page) {
		
		List<Notice> list = null;
		PageInfo pageInfo = null;
		
		int noticeCount = service.getNoticeCount();
		pageInfo = new PageInfo(page, 10, service.getNoticeCount(), 10);
		list = service.getNoticeList(pageInfo);
				
		model.addObject("noticeCount", noticeCount); 
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list); 
		model.setViewName("notice/noticeList");
		
		return model;
	}
	
	// 작성
	@GetMapping("/noticeWrite")
	public String write() {
		log.info("공지사항 작성");
		
		return "notice/noticeWrite";
	}
	
	@PostMapping("/noticeWrite")
	public ModelAndView write(
			ModelAndView model,
			@ModelAttribute Notice notice,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
		// 작성한 게시글 데이터를 데이터 베이스에 저장
		notice.setWriterNo(loginMember.getNo());
		result = service.save(notice);
		
		if(result > 0) {
			model.addObject("msg", "공지사항이 등록되었습니다.");
			model.addObject("location", "/notice/noticeList");
		} else {
			model.addObject("msg", "공지사항 등록을 실패하였습니다.");
			model.addObject("location", "/notice/noticeWrite");
		}
				
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 수정
	@GetMapping("/noticeUpdate")
	public ModelAndView update(ModelAndView model, 
							   @RequestParam int no,
							   @SessionAttribute("loginMember") Member loginMember) {
		
		Notice notice = null;
		
		notice = service.findNoticeByNo(no);

		if(notice.getWriterNo() == 1) {
			model.addObject("notice", notice);
			model.setViewName("notice/noticeUpdate");
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/notice/noticeList");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/noticeUpdate")
	public ModelAndView update(ModelAndView model,
							   @ModelAttribute Notice notice) {
		
		int result = 0;
		
		result = service.save(notice);
		
		if(result > 0) {
			model.addObject("msg", "공지사항을 수정했습니다.");
			model.addObject("location", "/notice/noticeList?no=" + notice.getNo());
		} else {
			model.addObject("msg", "공지사항 수정을 실패했습니다.");
			model.addObject("location", "/notice/noticeUpdate?no=" + notice.getNo());
		}
		
		model.setViewName("common/msg");
	
		return model;
	}
	
	// 삭제
	@GetMapping("/noticeDelete")
	public ModelAndView delete(ModelAndView model, 
					@SessionAttribute("loginMember") Member loginMember,
					@RequestParam int no) {
		int result = 0;
		Notice notice = null;
		
		notice = service.findNoticeByNo(no);
		
		if(notice.getWriterNo() == (loginMember.getNo())) {
			result = service.delete(no);
			
			if(result > 0) {
				model.addObject("msg", "공지사항을 삭제했습니다.");
				model.addObject("location", "/notice/noticeList");
			} else {
				model.addObject("msg", "공지사항 삭제를 실패했습니다.");
				model.addObject("location", "/notice/noticeList");
			}
		} else {
			model.addObject("msg", "관리자가 아닙니다.");
			model.addObject("location", "/notice/noticeList");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
}
