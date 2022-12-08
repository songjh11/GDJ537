package com.app.home.messenger;

import lombok.Data;

@Data
public class RoomVO {

	// 채팅방 번호
	private int roomNum;
	// 채팅방 이름
	private String roomName;
	
	public String toString() {
		return "Room[roomNum="+roomNum+", roomName="+roomName+"]";
	}
	
}
