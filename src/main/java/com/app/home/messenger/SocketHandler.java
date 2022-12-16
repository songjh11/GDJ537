package com.app.home.messenger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SocketHandler extends TextWebSocketHandler{

	
	private static List<WebSocketSession> weblist = new ArrayList<>();
	
	HashMap<String, WebSocketSession>sessionMap=new HashMap<>(); // 웹소켓 세션을 담아둘 맵
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	//메서지 발송
		
		String msg= message.getPayload();
		for (String key: sessionMap.keySet()) {
			WebSocketSession wss= sessionMap.get(key);
			try {
			wss.sendMessage(new TextMessage(msg));
			}catch(Exception e) {
				e.printStackTrace();
			}
     	}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		SecurityContextImpl contextImpl= (SecurityContextImpl)session.getAttributes().get("SPRING_SECURITY_CONTEXT");
		UserVO userVO = (UserVO)contextImpl.getAuthentication().getPrincipal();
		 
		System.out.println("UserName : "+userVO.getName());
		
		sessionMap.put(session.getId(), session);
		
//		JSONObject obj =new JSONObject();
//		obj.put("type", "getId");
//		obj.put("sessionId", session.getId());
//		session.sendMessage(new TextMessage(obj.toJSONString()));
		
		for (String key: sessionMap.keySet()) {
			WebSocketSession wss= sessionMap.get(key);
			try {
			wss.sendMessage(new TextMessage(userVO.getName()));
			}catch(Exception e) {
				e.printStackTrace();
			}
     	}
		
		weblist.add(session);
		log.info(session + "접속");
		
	}

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
	SecurityContextImpl contextImpl= (SecurityContextImpl)session.getAttributes().get("SPRING_SECURITY_CONTEXT");
	UserVO userVO = (UserVO)contextImpl.getAuthentication().getPrincipal();
		
	// 소켓 종료	
	sessionMap.remove(session.getId());
	super.afterConnectionClosed(session, status);
	
	log.info(session + "접속 해제");
	weblist.remove(session);
	}


    public static JSONObject jsonToOJsonObject(String jsonStr) {
    	JSONParser parser =new JSONParser();
    	JSONObject obj= null;
    	 
    	try {
    		obj=(JSONObject)parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}return obj;
     }



}


