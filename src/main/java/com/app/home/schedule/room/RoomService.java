package com.app.home.schedule.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RoomService
{
	@Autowired
	public RoomIF roomIF;

	public List<RoomVO> getRoomList(RoomVO roomVO) throws Exception
	{
		return roomIF.getRoomList(roomVO);
	}
}
