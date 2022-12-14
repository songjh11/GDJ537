package com.app.home.schedule.goods;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVO {
	
	private String goodsId;
	private String name;
	private int max;
	private String contents;
	private String location;
	private String carNum;
	
	private MultipartFile [] files;
	private List<GoodsFileVO> goodsFileVO;
	
}
