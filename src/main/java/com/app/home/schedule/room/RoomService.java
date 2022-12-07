package com.app.home.schedule.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.schedule.goods.GoodsMapper;
import com.app.home.schedule.goods.GoodsVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RoomService
{
	@Autowired
	public RoomMapper roomMapper;

	public List<GoodsVO> getRoomList(GoodsVO goodsVO) throws Exception
	{
		return roomMapper.getRoomList(goodsVO);
	}

	public GoodsVO getRoomTotal(GoodsVO goodsVO) throws Exception
	{
		return roomMapper.getRoomTotal(goodsVO);
	}
}
