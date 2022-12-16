package com.app.home.schedule.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;

@Mapper
public interface CarMapper {
	
	public List<ReserveVO> getStartTime(ReserveVO reserveVO) throws Exception;
	
	// 예약 취소
	public int setDelete(ReserveVO reserveVO) throws Exception;
	
	// 예약 변경
	public int setUpdate(ReserveVO reserveVO) throws Exception;
	
	// 예약 상세보기
	public ReserveVO getReserveDetail(ReserveVO reserveVO) throws Exception;
	
	// 예약 리스트
	public List<ReserveVO> getReserveList(ReserveVO reserveVO) throws Exception;
	
	// 예약
	public int setReserve(ReserveVO reserveVO) throws Exception;	
	
	// 차량 상세보기
	public GoodsVO getGoods(GoodsVO goodsVO) throws Exception;
	
	// 차량 전체 리스트
	public List<GoodsVO> getGoodsList(GoodsVO goodsVO) throws Exception;
}
