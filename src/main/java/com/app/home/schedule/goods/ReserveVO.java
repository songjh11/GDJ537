package com.app.home.schedule.goods;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserveNum;
	private String id;
	private Timestamp date;
	private Long memberNum;
	private String usePurpose;
	private Timestamp startTime;
	private Timestamp endTime;
	
	private GoodsVO goodsVO;
}
