package com.app.home.report;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportApplyVO {
	private Long applyNum;
	private int id;
	private int depNum;
	private int reportNum;
	private int status;
	private int returns;
	private Date apDate;
}
