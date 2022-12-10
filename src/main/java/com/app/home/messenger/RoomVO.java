package com.app.home.messenger;

import java.sql.Date;
import java.util.List;

import com.app.home.user.EmployeeVO;

import lombok.Data;

@Data
public class RoomVO {

	// 채팅방 번호
	private Integer roomNum;
	// 채팅방 생성일자
	private Date regDate;
	// 채팅방 이름
	private String roomName;
	// 채팅방 방장
	private Integer hostId;
	// 채팅방 비밀번호
	private Integer pw;
	
	// 방장 한명
	private Integer num;
	// 방인원 여러명
	private List<EmployeeVO> employeeVOs;
	
//	public String toString() {
//		return "Room[roomNum="+roomNum+", roomName="+roomName+"]";
//	}
	
}
