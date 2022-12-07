package com.app.home.schedule.car;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;

@Mapper
public interface CarMapper {
	
	// 예약
	public int setReserve(ReserveVO reserveVO) throws Exception;
	
	// 상세보기
	public GoodsVO getGoods(GoodsVO goodsVO) throws Exception;
}
