package com.finalproject.petkage.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.finalproject.petkage.member.model.vo.Member;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}

		if(!("ROLE_ADMIN".equals(loginMember.getMemberRole()))) {
			request.setAttribute("msg", "관리자가 아닙니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}	


}
