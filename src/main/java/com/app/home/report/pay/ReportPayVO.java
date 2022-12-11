package com.app.home.report.pay;

import java.sql.Date;

import lombok.Data;
@Data
public class ReportPayVO {
	
	private Long rnum;
	private Long applyNum;
	private String title;
	private String wdate;
	private String cdate;
	private String category;
	private Long pay;
	private Long sum;
	private String payment;
	private Date date;
}
