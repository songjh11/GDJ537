package com.app.home.schedule.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {

	@Autowired
	private RoomMapper roomMapper;
	
	public int setAdd(RoomVO roomVo) throws Exception{
		return roomMapper.setAdd(roomVo);
		
	}
}
