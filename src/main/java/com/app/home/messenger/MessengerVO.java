package com.app.home.messenger;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class MessengerVO {
	
	private String userName;
	private String password;
	private String content;
	private String sendDate;
	private String isRead;
	
	public MessengerVO(String userName, String content) {
		this.userName = userName;
		this.content = content;
	}
}
