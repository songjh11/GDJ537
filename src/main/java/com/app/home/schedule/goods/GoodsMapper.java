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
	
	public GoodsFileVO getFileNumCheck(GoodsFileVO goodsFileVO) throws Exception;
	
	public int setFileNumCheckDelete(GoodsFileVO goodsFileVO) throws Exception;
	
	public List<GoodsVO> getRoomList() throws Exception;
	
	public List<GoodsVO> getCarList() throws Exception;
	
	public int setGoodsDelete(GoodsVO goodsVO) throws Exception;

	public int setGoodsFileDelete(GoodsVO goodsVO) throws Exception;
	
	public List<ReserveVO> getReserveList() throws Exception;
	
	public List<GoodsVO> getRoomNameList() throws Exception;
	
	public List<GoodsVO> getCarNameList() throws Exception;
	
	public List<ReserveVO> getreserveGoods(GoodsVO goodsVO) throws Exception;
	
	public int getreserveCount(GoodsVO goodsVO) throws Exception;
}
