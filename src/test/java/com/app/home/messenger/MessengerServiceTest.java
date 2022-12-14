package com.app.home.messenger;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.app.home.user.UserVO;

@SpringBootTest
class MessengerServiceTest {

	@Autowired
	private MessengerMapper messengerMapper;
	
	//@Test
	void setAddRoomUserTest()throws Exception{
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNum(1);
		UserVO userVO = new UserVO();
		userVO.setId(5678);
		int result = messengerMapper.setAddRoomUser(roomVO);
		
		assertEquals(result, 0);
	}
	
	//@Test
	void setAddRoomTest()throws Exception {
		
		RoomVO roomVO = new RoomVO();
		roomVO.setHostId(5);
		roomVO.setRoomName("채팅방");
		
		
		int result = messengerMapper.setAddRoom(roomVO);
		
		assertEquals(1, result);
		
	}

}
