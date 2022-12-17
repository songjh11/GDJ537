package com.app.home.schedule.goods;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.app.home.user.UserVO;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reservenum;
	private String goodsId;
	private String date;
	private int id;
	private String usePurpose;
	private String startTime;
	private String endTime;
	
	private List<GoodsVO> goodsVOs;
	private GoodsVO goodsVO;
	private UserVO userVO;
//	filter
	private boolean room;
	private boolean car;
	private boolean vacation;
	
//	부서 filter
	private String depName;
}
