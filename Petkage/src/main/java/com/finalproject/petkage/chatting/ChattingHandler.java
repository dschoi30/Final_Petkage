package com.finalproject.petkage.chatting;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequestMapping("/chatting")
public class ChattingHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("{} 연결됨", session.getId());
		sessionList.add(session);
		
		log.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
	}
	
	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.info(session.getId() + ": " + message.getPayload());
		
		// 모든 유저에게 메세지 출력
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		}
	}
	
	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("{} 연결 끊김", session.getId());

		sessionList.remove(session);
		
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
	}
}
