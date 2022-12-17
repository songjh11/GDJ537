package com.app.home.schedule.goods;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.user.DepartmentVO;
import com.app.home.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GoodsService
{

   @Autowired
   private GoodsMapper goodsMapper;
   @Value("${app.upload.goods}")
   private String path;
   @Autowired
   private FileManager fileManager;
   

   public int setAdd(GoodsVO goodsVO, MultipartFile[] files, ServletContext servletContext) throws Exception
   {
      int count = goodsMapper.getCount(goodsVO);
      
      
      if(count == 0) {
         count = 1000;
      }
      else
      {
         count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2)) + 1;
      }
      if(goodsVO.getGoodsId().equals("RO")) {
         goodsVO.setCarNum(null);
      }
      goodsVO.setGoodsId(goodsVO.getGoodsId().concat(String.valueOf(count)));
      
      int result = goodsMapper.setAdd(goodsVO);
      
      if(result == 1) {
    	  goodsMapper.setReserveInit(goodsVO);
      }

      if (files.length != 0)
      {
         for (MultipartFile file : files)
         {
            log.info("test1 => {}", file);
            log.info("test1 => {}", file.isEmpty());
            if (!file.isEmpty())
            {
               log.info(" test2 => {}", path);
               String fileName = fileManager.saveFile(path, servletContext, file);
               GoodsFileVO goodsFileVO = new GoodsFileVO();
               goodsFileVO.setFileName(fileName);
               goodsFileVO.setOriName(file.getOriginalFilename());
               goodsFileVO.setGoodsId(goodsVO.getGoodsId());
               goodsMapper.setGoodsFileAdd(goodsFileVO);
            }
         }
      }
      return result;
   }

   public GoodsVO getGoods(GoodsVO goodsVO) throws Exception
   {
      return goodsMapper.getGoods(goodsVO);
   }
   
   public int setUpdate(GoodsVO goodsVO,MultipartFile [] files,ServletContext servletContext,String [] fileUpdateNumber) throws Exception{
//      int count = goodsMapper.getCount(goodsVO);
//      
//      if(count == 0) {
//         count = 1000;
//      }else {
//         count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2))+1;
//      }
//      goodsVO.setId(goodsVO.getId().concat(String.valueOf(count)));
      int result =  goodsMapper.setUpdate(goodsVO);
      int count = 0;
      GoodsFileVO goodsFileVO = new GoodsFileVO();
      if(files.length != 0) {
         
         for(MultipartFile file : files) {
            log.info("test1 => {}", file);
            log.info("test1 => {}", file.isEmpty());
            
            if(!file.isEmpty()) {
               
               String fileName = fileManager.saveFile(path,servletContext, file);
               if(fileUpdateNumber != null) {
                  if(fileUpdateNumber.length-1 < count) {
                     goodsFileVO = new GoodsFileVO();
                     
                     goodsFileVO.setFileName(fileName);
                     goodsFileVO.setOriName(file.getOriginalFilename());
                     goodsFileVO.setGoodsId(goodsVO.getGoodsId());
                     goodsMapper.setGoodsFileAdd(goodsFileVO);
                  }else {
                     goodsFileVO.setImgNum(Long.parseLong(fileUpdateNumber[count]));
                     goodsFileVO.setFileName(fileName);
                     goodsFileVO.setOriName(file.getOriginalFilename());
                     goodsFileVO.setGoodsId(goodsVO.getGoodsId());
                     goodsMapper.setFileUpdate(goodsFileVO);
                     count++;
                  }
               }else if(fileUpdateNumber == null) {
                  goodsFileVO = new GoodsFileVO();
                  
                  goodsFileVO.setFileName(fileName);
                  goodsFileVO.setOriName(file.getOriginalFilename());
                  goodsFileVO.setGoodsId(goodsVO.getGoodsId());
                  goodsMapper.setGoodsFileAdd(goodsFileVO);
               }
            }
         }
      }
         return result;
   }


   public int getCount(GoodsVO goodsVO) throws Exception
   {
      return goodsMapper.getCount(goodsVO);
   }


   public String getMaxCount(GoodsVO goodsVO) throws Exception
   {
      return goodsMapper.getMaxCount(goodsVO);
   }
   
   public GoodsFileVO getFileNumCheck(GoodsFileVO goodsFileVO) throws Exception{
      return goodsMapper.getFileNumCheck(goodsFileVO);
   }
   
   public int setFileNumCheckDelete(GoodsFileVO goodsFileVO) throws Exception{
      return goodsMapper.setFileNumCheckDelete(goodsFileVO);
   }
   
   public int setGoodsDelete(GoodsVO goodsVO) throws Exception{
      goodsMapper.setGoodsFileDelete(goodsVO);
      return goodsMapper.setGoodsDelete(goodsVO);
   }
    
   public List<GoodsVO> getRoomList() throws Exception{
      return goodsMapper.getRoomList();
   }
   
   public List<GoodsVO> getCarList() throws Exception{
      return goodsMapper.getCarList();
   }
   public List<ReserveVO> getReserveList(ReserveVO reserveVO) throws Exception{
      
      return goodsMapper.getReserveList(reserveVO);
   }
   
   public List<GoodsVO> getRoomNameList() throws Exception{
      return goodsMapper.getRoomNameList();
   }
   
   public List<GoodsVO> getCarNameList() throws Exception{
      return goodsMapper.getCarNameList();
   }
   
   public List<ReserveVO> getreserveGoods(GoodsVO goodsVO) throws Exception{
      return goodsMapper.getreserveGoods(goodsVO);
   }
   
   public int getreserveCount(ReserveVO reserveVO) throws Exception{
      return goodsMapper.getreserveCount(reserveVO);
   }
   
   public int getRoomTotal(ReserveVO reserveVO) throws Exception{
      return goodsMapper.getRoomTotal(reserveVO);   
   }
   
   public int getCarTotal(ReserveVO reserveVO) throws Exception{
      return goodsMapper.getCarTotal(reserveVO);   
   }
   
   public int getDepartmentRoomTotal(ReserveVO reserveVO) throws Exception{
      return goodsMapper.getDepartmentRoomTotal(reserveVO);
   }
   
   public int getDepartmentCarTotal(ReserveVO reserveVO) throws Exception{
      return goodsMapper.getDepartmentCarTotal(reserveVO);
   }
   
   public int getRoomNowTotal(String month) throws Exception{
      return goodsMapper.getRoomNowTotal(month);
   }
   public int getCarNowTotal(String month) throws Exception{
      return goodsMapper.getCarNowTotal(month);
   }



}