package com.finalproject.petkage.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.finalproject.petkage.member.model.vo.Member;

public final class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러 실행 전 작업을 진행하는 메소드
		// 반환값 false일 경우 컨트롤러를 실행하지 않음
		System.out.println("postHandle() 호출");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러 실행 후 작업을 진행하는 메소드
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 컨트롤러 처리 이후 화면 처리가 완료되면 실행되는 메소드 
		System.out.println("afterCompletion() 호출");
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//비동기 요청 시 postHandle(), afterCompletion()을 수행하지 않고 afterConcurrentHandlingStarted() 메소드 호출
		System.out.println("afterConcurrentHandlingStarted() 호출");
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
