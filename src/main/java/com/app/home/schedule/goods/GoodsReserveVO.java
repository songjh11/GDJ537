package com.app.home.schedule.goods;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsReserveVO {
	private Long reserveNum;
	private String goodsId;
	private Timestamp date;
	private Long memberNum;
	private String usePurpose;
	private Timestamp startTime;
	private Timestamp endTime;
	
	
	private GoodsVO goodsVO;
	
//	filter
	private boolean room;
	private boolean car;
	private boolean vacation;
}
