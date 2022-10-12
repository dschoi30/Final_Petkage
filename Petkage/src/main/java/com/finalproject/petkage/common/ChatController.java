package com.finalproject.petkage.common;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finalproject.petkage.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public void chat(Model model) {
		
		Member user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUserName());
		
		model.addAttribute("userName", user.getUserName());
	}

}
