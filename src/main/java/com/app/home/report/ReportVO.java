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
	
	private List<ReportApplyVO> reportApplyVOs;
	
	
	
	
}
