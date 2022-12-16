package com.app.home.schedule.goods;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GoodsService
{

	@Autowired
	private GoodsMapper goodsMapper;

	@Autowired
	private FileManager fileManager;
	@Value("${app.upload.goods}")
	private String filePath;
	
	

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
			goodsVO.setCarnum(null);
		}
		goodsVO.setGoodsId(goodsVO.getGoodsId().concat(String.valueOf(count)));
		
		int result = goodsMapper.setAdd(goodsVO);
		String path = filePath;

		if (files.length != 0)
		{
			for (MultipartFile file : files)
			{
				log.info("test1 => {}", file);
				log.info("test1 => {}", file.isEmpty());
				if (!file.isEmpty())
				{

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
	
	public int setUpdate(GoodsVO goodsVO,MultipartFile [] files,ServletContext servletContext,String [] fileUpdatenumber) throws Exception{
//		int count = goodsMapper.getCount(goodsVO);
//		
//		if(count == 0) {
//			count = 1000;
//		}else {
//			count = Integer.parseInt(goodsMapper.getMaxCount(goodsVO).substring(2))+1;
//		}
//		goodsVO.setId(goodsVO.getId().concat(String.valueOf(count)));
		int result =  goodsMapper.setUpdate(goodsVO);
		String path = filePath ;
		int count = 0;
		GoodsFileVO goodsFileVO = new GoodsFileVO();
		if(files.length != 0) {
			
			for(MultipartFile file : files) {
				log.info("test1 => {}", file);
				log.info("test1 => {}", file.isEmpty());
				
				if(!file.isEmpty()) {
					
					String fileName = fileManager.saveFile(path,servletContext, file);
					if(fileUpdatenumber != null) {
						if(fileUpdatenumber.length-1 < count) {
						
							goodsFileVO.setFileName(fileName);
							goodsFileVO.setOriName(file.getOriginalFilename());
							goodsFileVO.setGoodsId(goodsVO.getGoodsId());
							goodsMapper.setGoodsFileAdd(goodsFileVO);
						}else {
							goodsFileVO.setImgnum(Long.parseLong(fileUpdatenumber[count]));
							goodsFileVO.setFileName(fileName);
							goodsFileVO.setOriName(file.getOriginalFilename());
							goodsFileVO.setGoodsId(goodsVO.getGoodsId());
							goodsMapper.setGoodsFileAdd(goodsFileVO);
							count++;
						}
					}else if(fileUpdatenumber == null) {
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
	
	public GoodsFileVO getFilenumCheck(GoodsFileVO goodsFileVO) throws Exception{
		return goodsMapper.getFilenumCheck(goodsFileVO);
	}
	
	public int setFilenumCheckDelete(GoodsFileVO goodsFileVO) throws Exception{
		return goodsMapper.setFilenumCheckDelete(goodsFileVO);
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
	public List<ReserveVO> getReserveList(GoodsReserveVO goodsReserveVO) throws Exception{
		
		return goodsMapper.getReserveList(goodsReserveVO);
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
	
	public int getreserveCount(GoodsVO goodsVO) throws Exception{
		return goodsMapper.getreserveCount(goodsVO);
	}
	
	public int getRoomTotal() throws Exception{
		return goodsMapper.getRoomTotal();	
	}
	
	public int getCarTotal() throws Exception{
		return goodsMapper.getCarTotal();	
	}

}
