package com.app.home.messenger;

import java.sql.Date;
import java.util.List;

import com.app.home.user.UserVO;

import lombok.Data;

@Data
public class RoomVO {

	// 채팅방 번호
	private Integer roomnum;
	// 채팅방 생성일자
	private Date regDate;
	// 채팅방 이름
	private String roomName;
	// 채팅방 방장
	private Integer hostId;
	// 채팅방 비밀번호
	private Integer pw;
	
	// 유저목록
	private Integer userNum;
	// 유저한명
	private UserVO userVO;
	// 유저 여러명
	private List<UserVO> userVOs;
	// 방인원의 id를 받을 배열선언
	private int [] id;
	
}
