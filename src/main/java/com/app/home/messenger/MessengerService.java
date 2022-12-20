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
			UserVO hostVO = roomVO.getUserVO();
			if(hostVO != null) {
				
				// 방장을 유저에 추가
				result = messengerMapper.setAddRoomUser(roomVO);
				
				// 그 후 유저들 인서트
				if(result > 0) {
					for(int ids : roomVO.getId()) {
						
						UserVO userVO = new UserVO();
						userVO.setId(ids);
						roomVO.setUserVO(userVO);
						
						result = messengerMapper.setAddRoomUser(roomVO);
						
					}
					
				}
			}
			
		}
		
		return result;
	}
	
	// 채팅방 목록 조회
	public List<RoomVO> getRoomList(RoomVO roomVO)throws Exception{
		return messengerMapper.getRoomList(roomVO);
	}
	
	// 채팅방 인원 수 조회
	public int getUserCount(RoomVO roomVO)throws Exception{
		return messengerMapper.getUserCount(roomVO);
	}
	
	// 비밀번호 조회
	public RoomVO getRoomPw(RoomVO roomVO)throws Exception{
		return messengerMapper.getRoomPw(roomVO);
	}
	
	// 비밀번호가 있는지 없는지 조회
	public int getPwCheck(RoomVO roomVO)throws Exception{
		return messengerMapper.getPwCheck(roomVO);
	}
	
	//채팅방 제목
	public String getChatName (RoomVO roomVO) throws Exception{
		return messengerMapper.getChatName(roomVO);
	}
	
}
