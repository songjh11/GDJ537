package com.app.home.schedule.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.schedule.goods.GoodsVO;

@Mapper
public interface RoomMapper
{
	public List<GoodsVO> getRoomList(GoodsVO goodsVO) throws Exception;

	public GoodsVO getRoomTotal(GoodsVO goodsVO) throws Exception;
	
	public int setRoomReserve(RoomVO roomVO) throws Exception;
	
	public List<RoomVO> getReserveStartTime(RoomVO roomVO) throws Exception;
	
	public List<RoomVO> getResInfo(RoomVO roomVO) throws Exception;
}
