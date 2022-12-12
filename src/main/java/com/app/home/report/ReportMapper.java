package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.report.util.Pager;
@Mapper
public interface ReportMapper {
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	public List<ReportVO> selectList(Pager pager) throws Exception;
	
	public int insertList(ReportApplyVO reportApplyVO) throws Exception;
	
	public ReportApplyVO selectDetail(ReportApplyVO reportApplyVO) throws Exception;
	
	
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
