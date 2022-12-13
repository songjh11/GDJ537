package com.app.home.report;

import java.sql.Date;

import lombok.Data;

@Data
public class WorkReportVO {
	 private Long rNum;
	 private Long applyNum;
	 private Date date;
	 private String am;
	 private String pm;
	 private String unto;
	 private String todo;
	 private String wRong;
	 private String etc;
}
