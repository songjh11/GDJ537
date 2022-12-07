package com.app.home.schedule.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomIF
{
	public List<RoomVO> getRoomList(RoomVO roomVO) throws Exception;
}
