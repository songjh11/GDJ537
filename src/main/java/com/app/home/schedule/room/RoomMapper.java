package com.app.home.schedule.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;

@Mapper
public interface RoomMapper
{
	public List<GoodsVO> getRoomList(GoodsVO goodsVO) throws Exception;

	public GoodsVO getRoomTotal(GoodsVO goodsVO) throws Exception;

	public int setRoomReserve(GoodsRoomVO goodsRoomVO) throws Exception;

	public List<ReserveVO> getResInfo(GoodsRoomVO goodsRoomVO) throws Exception;

	public List<ReserveVO> getStartTime(ReserveVO reserveVO) throws Exception;

	public ReserveVO getReserveDetail(ReserveVO reserveVO) throws Exception;

	public int setReserveUpdate(ReserveVO reserveVO) throws Exception;

	public int setReserveDelete(ReserveVO reserveVO) throws Exception;
}
