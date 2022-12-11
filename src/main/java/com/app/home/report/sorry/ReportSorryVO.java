package com.app.home.report.sorry;

import java.util.Date;

import lombok.Data;

@Data
public class ReportSorryVO {
	
	private Long rnum;
	private Long applyNum;
	private Date date;
	private String text;
	private Long order;
}
