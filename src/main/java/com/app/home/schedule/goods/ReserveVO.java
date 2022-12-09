package com.app.home.schedule.goods;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserveNum;
	private String id;
	private Date date;
	private String startTime;
	private String endTime;
	private String memberNum;
	private String usePurpose;
	
	private GoodsVO goodsVO;
}
