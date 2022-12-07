package com.app.home.schedule.reserve;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserveNum;
	private String id;
	private Date date;
	private String memberNum;
	private String usePurpose;
	private Date startTime;
	private Date endTime;
}
