package com.app.home.schedule.goods;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GoodsMapper
{
	public int setAdd(GoodsVO goodsVO) throws Exception;

	public int getCount(GoodsVO goodsVO) throws Exception;

	public String getMaxCount(GoodsVO goodsVO) throws Exception;

	public int setGoodsFileAdd(GoodsFileVO goodsFileVO) throws Exception;

	public GoodsVO getGoods(GoodsVO goodsVO) throws Exception;

	public int setUpdate(GoodsVO goodsVO) throws Exception;

	public List<GoodsVO> getGoodsList(GoodsVO goodsVO) throws Exception;
}
