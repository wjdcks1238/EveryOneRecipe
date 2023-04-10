package com.kh.everyrecipe.chat.config;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	private static List<WebSocketSession> sessionList = new ArrayList<>();
	
	//연결 성공
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		logger.info(session + "클라이언트 접속");
	}
	
	//연결 끊음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		logger.info(session + "클라이언트 접속 해제");
		sessionList.remove(session);	
	}
	
	//웹소켓 서버로 메세지 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String payload = message.getPayload();
		logger.info("payload : " + payload);
		
		for(WebSocketSession sess : sessionList){
            sess.sendMessage(message);
        }
	}
	
	
}
