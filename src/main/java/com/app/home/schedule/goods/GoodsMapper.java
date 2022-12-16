package com.app.home.schedule.goods;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.app.home.user.DepartmentVO;

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
   
   
   public List<GoodsVO> getRoomNameList() throws Exception;
   
   public List<GoodsVO> getCarNameList() throws Exception;
   
   public List<ReserveVO> getreserveGoods(GoodsVO goodsVO) throws Exception;
   
   public int getreserveCount(GoodsVO goodsVO) throws Exception;
   
   public int getRoomTotal() throws Exception;
   
   public int getCarTotal() throws Exception;
   
   public List<ReserveVO> getReserveList(ReserveVO reserveVO) throws Exception;
   
   public int getDepartmentRoomTotal(DepartmentVO departmentVO) throws Exception;
   
   public int getDepartmentCarTotal(DepartmentVO departmentVO) throws Exception;
   
   public int setFileUpdate(GoodsFileVO goodsFileVO) throws Exception;
   
   public int getRoomNowTotal(String month) throws Exception;
   public int getCarNowTotal(String month) throws Exception;
   
   public int setReserveInit(GoodsVO goodsVO) throws Exception;
}