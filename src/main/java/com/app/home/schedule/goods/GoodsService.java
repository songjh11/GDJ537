package com.app.home.schedule.goods;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.schedule.goods.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private FileManager fileManager;
	
	public int setAdd(GoodsVO goodsVO,MultipartFile [] files,ServletContext servletContext) throws Exception{
		int count = goodsMapper.getCount(goodsVO);
		
		if(count == 0) {
			count = 1000;
		}else {
			count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2))+1;
		}
		goodsVO.setId(goodsVO.getId().concat(String.valueOf(count)));
		int result = goodsMapper.setAdd(goodsVO);
		String path = "resources/upload/goods" ;
		
		if(files.length != 0) {
			for(MultipartFile file : files) {
				log.info("test1 => {}", file);
				log.info("test1 => {}", file.isEmpty());
				if(!file.isEmpty()) {
					
					String fileName = fileManager.saveFile(path,servletContext, file);
					GoodsFileVO goodsFileVO = new GoodsFileVO();
					goodsFileVO.setFileName(fileName);
					goodsFileVO.setOriName(file.getOriginalFilename());
					goodsFileVO.setId(goodsVO.getId());
					goodsMapper.setGoodsFileAdd(goodsFileVO);
					}
				}
			}
		return result;	
	}
	
	public GoodsVO getGoods(GoodsVO goodsVO) throws Exception{
		return goodsMapper.getGoods(goodsVO);
	}
	
	public int setUpdate(GoodsVO goodsVO) throws Exception{
//		int count = goodsMapper.getCount(goodsVO);
//		
//		if(count == 0) {
//			count = 1000;
//		}else {
//			count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2))+1;
//		}
//		goodsVO.setId(goodsVO.getId().concat(String.valueOf(count)));
		return goodsMapper.setUpdate(goodsVO);
	}
	
	public int getCount(GoodsVO goodsVO) throws Exception{
		return goodsMapper.getCount(goodsVO);
	}
	
	public String getMaxCount(GoodsVO goodsVO) throws Exception{
		return goodsMapper.getMaxCount(goodsVO);
	}

}
