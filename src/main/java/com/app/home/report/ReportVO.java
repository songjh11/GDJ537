package com.app.home.report;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {
	
	private int licenserNum;
	private int depNum;
	private int id;
	private int lstatus;
	
	//====================
	
	private int applyNum;
	private int reportNum;
	private int status;
	private int returns;
	private Date appDate;
	
	
}
