package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	public Integer getLicenseCheck(ReportVO reportVO) throws Exception{
		return reportMapper.getLicenseCheck(reportVO);
	}
	
	public ReportVO getFinishReport(ReportVO reportVO) throws Exception{
		return reportMapper.getFinishReport(reportVO);
	}
	
	public ReportVO getReturnReport(ReportVO reportVO) throws Exception{
		return reportMapper.getReturnsReport(reportVO);
	}
	
	public ReportVO getDoFirstReport(ReportVO reportVO) throws Exception{
		return reportMapper.getDoFirstReport(reportVO);
	}
	
	public ReportVO getDoFinalReport(ReportVO reportVO) throws Exception{
		return reportMapper.getDoFinalReport(reportVO);
	}
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	public List<ReportVO> getMyReportList() throws Exception{
		return reportMapper.getMyReportList();
	}
	
	
	
	
	
	
	
	
	//================================================
}
