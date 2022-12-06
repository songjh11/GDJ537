package com.app.home.schedule.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	public int setAdd(GoodsVO goodsVO) throws Exception{
		int count = goodsMapper.getCount(goodsVO);
		
		if(count == 0) {
			count = 1000;
		}else {
			count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2))+1;
		}
		goodsVO.setId(goodsVO.getId().concat(String.valueOf(count)));
		
		return goodsMapper.setAdd(goodsVO);
	}
	

}
