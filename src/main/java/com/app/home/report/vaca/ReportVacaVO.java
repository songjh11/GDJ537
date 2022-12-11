package com.app.home.report.vaca;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVacaVO {
	
	private Long rnum;
	private Long applyNum;
	private Long category;
	private String text;
	private String period;
	private Long call;
	private Date date;
}
