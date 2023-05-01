package com.kh.everyrecipe.chat.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.everyrecipe.chat.service.ChatService;
import com.kh.everyrecipe.chat.vo.MessageVo;

@Component
public class ChatHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService cService;
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Object> userMap = new HashMap<String, Object>();
	
	//연결 성공
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
	}
	
	//연결 끊음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
	}
	
	//웹소켓 서버로 메세지 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");			
		
		
	
			if(type != null && type.contentEquals("register")) {
				String user = object.getString("userid");
				userMap.put(user, session);	
			
			} else {
				String target = object.getString("target");			
				WebSocketSession ws = (WebSocketSession)userMap.get(target);
				String msg = object.getString("message");
				
				MessageVo cm = new MessageVo();
				cm.setKey(object.getInt("key"));
				cm.setMessage(object.getString("message"));
				cm.setUserId(object.getString("userid"));
				System.out.println(cm);
				
				cService.insertMessage(cm);
	
				if(ws != null) {
					ws.sendMessage(new TextMessage(msg));
				}
			}
		}	
}