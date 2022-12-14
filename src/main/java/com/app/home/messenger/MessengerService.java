package com.app.home.messenger;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.DepartmentVO;

import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MessengerService {

	@Autowired
	private MessengerMapper messengerMapper; 
	
	public List<UserVO> getEmpList () throws Exception{
		return messengerMapper.getEmpList();
	}
	
	public List<DepartmentVO> getDepList() throws Exception{
		return messengerMapper.getDepList();
	}
	
	public List<UserVO> getSearchResult (Map<String, String> map) throws Exception{
		return messengerMapper.getSearchResult(map); 
	}
	
	// 채팅방 생성
	public int setAddRoom(RoomVO roomVO)throws Exception{
		
		int result = messengerMapper.setAddRoom(roomVO);
		
		if(result > 0) {
			
			for(int ids : roomVO.getId()) {
				
				UserVO userVO = new UserVO();
				userVO.setId(ids);
				roomVO.setUserVO(userVO);
				
				result = messengerMapper.setAddRoomUser(roomVO);
				
			}
			
		}
		
		return result;
	}
	
	// 채팅방 목록
	public List<RoomVO> getRoomList(RoomVO roomVO)throws Exception{
		return messengerMapper.getRoomList(roomVO);
	}
	
	public int getUerCount()throws Exception{
		return messengerMapper.getUerCount();
	}
	
}
