package com.app.home.report;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReportVO {
	
	private int licensernum;
	private int depnum;
	private int id;
	private int lstatus;
	

	private List<ReportApplyVO> reportApplyVOs;
	
	
	
	
}
