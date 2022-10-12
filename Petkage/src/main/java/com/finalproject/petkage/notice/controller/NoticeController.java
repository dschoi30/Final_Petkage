package com.finalproject.petkage.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
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
		
		pageInfo = new PageInfo(page, 10, service.getNoticeCount(), 10);
		list = service.getNoticeList(pageInfo);
		int noticeCount = service.getNoticeCount();
		
		
		System.out.println(list);
		System.out.println(noticeCount);
		
		model.addObject("list", list); 
		model.addObject("noticeCount", noticeCount); 
		model.addObject("pageInfo", pageInfo);
		model.setViewName("notice/noticeList");
		
		return model;
	}
}
