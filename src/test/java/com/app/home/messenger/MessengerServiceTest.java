package com.app.home.messenger;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MessengerServiceTest {

	@Autowired
	private MessengerMapper messengerMapper;
	
//	@Test
	void setAddRoomtest()throws Exception {
		
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomName("채팅방");
		roomVO.setHostId(1234);
		
		int result = messengerMapper.setAddRoom(roomVO);
		
		assertEquals(1, result);
		
	}

}
