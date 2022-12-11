package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface ReportMapper {
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	public Integer getLicenseCheck(ReportVO reportVO) throws Exception;
	
	public ReportVO getFinishReport(ReportVO reportVO) throws Exception;
	
	public ReportVO getReturnsReport(ReportVO reportVO) throws Exception;
	
	public ReportVO getDoFirstReport(ReportVO reportVO) throws Exception;
	
	public ReportVO getDoFinalReport(ReportVO reportVO) throws Exception;
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	public List<ReportVO> getMyReportList() throws Exception;
	
	
	
	
	
	
	
	//================================================
	
}
