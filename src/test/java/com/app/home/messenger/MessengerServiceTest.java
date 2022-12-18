package com.app.home.messenger;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.crt.Log;

@SpringBootTest
@Slf4j
class MessengerServiceTest {

	@Autowired
	private MessengerMapper messengerMapper;
	
	//@Test
	void getPwTest()throws Exception{
		
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNum(26);
		
		roomVO = messengerMapper.getRoomPw(roomVO);
		
		int result = roomVO.getPw();
		
		log.info("비밀번호 나오닝? ====> {} ", roomVO.getPw());
		
		assertNotEquals(result, 0);
		
	}
	
	//@Test
	void getUserCount()throws Exception{
		
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNum(26);
		
		int userCount = messengerMapper.getUserCount(roomVO);
		
		assertNotEquals(userCount, 0);
		
	}
	
	@Test
	void getRoomListTest()throws Exception{
		List<RoomVO> roomVOs = new ArrayList<>();
		
		RoomVO roomVO = new RoomVO();

		roomVO.setHostId(2022003);
		roomVO.getUserVO().setId(2022003);
		
		roomVOs = messengerMapper.getRoomList(roomVO);
		
		assertNotEquals(0,roomVOs.size());
		
	}
	
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
