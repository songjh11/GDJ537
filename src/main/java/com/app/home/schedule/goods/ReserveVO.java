package com.app.home.schedule.goods;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserveNum;
	private String goodsId;
	private String date;
	private Long id;
	private String usePurpose;
	private String startTime;
	private String endTime;
	
	private List<GoodsVO> goodsVOs;
}
