package com.app.home.schedule.goods;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserveNum;
	private String goodsId;
	private Timestamp date;
	private Long ID;
	private String usePurpose;
	private String startTime;
	private String endTime;
	
	private GoodsVO goodsVO;
}
