package com.app.home.schedule.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.schedule.goods.GoodsVO;

@Mapper
public interface RoomMapper
{
	public List<GoodsVO> getRoomList(GoodsVO goodsVO) throws Exception;

	public GoodsVO getRoomTotal(GoodsVO goodsVO) throws Exception;
}
