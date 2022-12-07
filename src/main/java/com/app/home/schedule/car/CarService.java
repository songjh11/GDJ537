package com.app.home.schedule.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CarService {
	
	@Autowired
	private CarMapper carMapper;

	// 예약
	public int setReserve(ReserveVO reserveVO) throws Exception {
		
		int result = carMapper.setReserve(reserveVO);
		
		return result; 
	}
	
	// 상세보기
	public GoodsVO getGoods(GoodsVO goodsVO) throws Exception {
		
		return carMapper.getGoods(goodsVO);
	}

}
