package com.app.home.report;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReportVO {
	
	private int licenserNum;
	private int depNum;
	private int id;
	private int lstatus;
	
	//=====
	private int report_Num;
	private String report_ID;
	private String report_Contents;
	private Date report_Date;
	
	private List<ReportApplyVO> reportApplyVOs;
	
	
	
	
}
