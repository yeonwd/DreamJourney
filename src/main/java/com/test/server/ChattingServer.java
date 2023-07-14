package com.test.server;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.test.domain.ChatDTO;

@ServerEndpoint("/chattingserver.do")
public class ChattingServer {

	private static List<Session> sessionList;

	static {
		sessionList = new ArrayList<Session>();
	}

	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("OnOpen!");
		sessionList.add(session);
	}

	@OnMessage
	public void handleMessage(String msg, Session session) {
		System.out.println("msg");

		Gson gson = new Gson();

		ChatDTO dto = gson.fromJson(msg, ChatDTO.class);

		// 채팅방에 입장했을 때 메시지 전송
		if (dto.getCode().equals("1")) {

			for (Session s : sessionList) {
				if (s != session) {
					// 나 이외의 다른 사람에게 메시지 전송

					try {
						s.getBasicRemote().sendText(msg);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

		// 채팅방 퇴장했을 때 메시지 전송
		} else if (dto.getCode().equals("2")) {

			// 퇴장시 나의 세션을 제거
			sessionList.remove(session);
			
			for (Session s: sessionList) {
				
				try {
					s.getBasicRemote().sendText(msg);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
			
		} else if (dto.getCode().equals("3")) {
			
			for (Session s : sessionList) {
				if (s != session) {
					try {
						s.getBasicRemote().sendText(msg);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		
	}

	@OnClose
	public void handleClose() {

	}

	@OnError
	public void handleError(Throwable e) {
	}
	
	
	public void clearSession() {
		Iterator<Session> iter = sessionList.iterator();
		
		while (iter.hasNext()) {
			if (!(iter.next()).isOpen()) {
				iter.remove();
			}
		}
	}
	

}
