package com.finalproject.petkage.chatting.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView model) {
		model.setViewName("common/chatting");
		
//		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		if(member == null){
//			log.debug("member is null");
//			} else{
//			log.debug("member is not null");
//			}
//		System.out.println("username :" + member.getUserName());
//		
//		model.addObject("userid", member.getUserName());
		
		return model;
	}
	
	

}
