package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.beans.factory.annotation.Autowired;



import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;

@Mapper
public interface ReportMapper {
	
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO) throws Exception;
	
	public List<UserVO> getReportList(UserVO userVO) throws Exception;
	
	public int setLicenserAdd(UserVO userVO) throws Exception;
	
	
	
	
	
	
	
	
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
	
	
	public List<ReportVacaVO> getMyVacaList(ReportPager pager) throws Exception;
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception;
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception;
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception;
	
	
	
	
	//================================================
	
}
