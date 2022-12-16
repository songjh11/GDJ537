package com.app.home.schedule.goods;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsReserveVO {
	private Long reservenum;
	private String goodsId;
	private Timestamp date;
	private Long membernum;
	private String usePurpose;
	private Timestamp startTime;
	private Timestamp endTime;
	
	
//	filter
	private boolean room;
	private boolean car;
	private boolean vacation;
}
