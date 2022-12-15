package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.DepartmentVO;

import com.app.home.user.UserVO;

@Mapper
public interface MessengerMapper {

	public List<UserVO> getEmpList () throws Exception;
	
	public List<DepartmentVO> getDepList() throws Exception;
	
	public List<UserVO> getSearchResult (Map<String, String> map) throws Exception;
	
	// 채팅방 생성
	public int setAddRoom(RoomVO roomVO)throws Exception;
	
	// 채팅방 유저 추가
	public int setAddRoomUser(RoomVO roomVO)throws Exception;
	
	// 채팅방 목록 조회
	public List<RoomVO> getRoomList(RoomVO roomVO)throws Exception;
	
	// 참여인원 조회
	public int getUserCount(RoomVO roomVO)throws Exception;
	
	// 비밀번호가 있는지 없는지 조회
	public RoomVO getRoomPw(RoomVO roomVO)throws Exception;
	
}
