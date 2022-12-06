package com.app.home.schedule.goods;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVO {
	
	private String id;
	private String name;
	private int max;
	private String contents;
	private String location;
	
	private MultipartFile [] files;
	
}
