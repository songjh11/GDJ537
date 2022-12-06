package com.app.home.schedule.goods;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GoodsMapper {
	
	public int setAdd(GoodsVO goodsVO) throws Exception;
	
	public int getCount(GoodsVO goodsVO) throws Exception;
	 
	public String getMaxCount(GoodsVO goodsVO) throws Exception;
	
	public int setGoodsFileAdd(GoodsFileVO goodsFileVO) throws Exception;


}
