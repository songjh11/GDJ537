package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.report.util.Pager;

@Service
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	public List<ReportVO> selectList(Pager pager) throws Exception{
		pager.getStartRow();
		return reportMapper.selectList(pager);
	}
	
	public int insertList(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.insertList(reportApplyVO);
	}
	
	public ReportApplyVO selectDetail(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.selectDetail(reportApplyVO);
	}
	
	
	
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
