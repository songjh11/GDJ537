package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.beans.factory.annotation.Autowired;



import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
import com.app.home.user.DepartmentVO;
import com.app.home.user.UserVO;

@Mapper
public interface ReportMapper {
	
	
	
	//=======================김도영===================
	//신청보고서
	public int setReportApply(ReportApplyVO reportApplyVO)throws Exception;
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO) throws Exception;
	
	public List<UserVO> getReportList(UserVO userVO) throws Exception;
	
	public int setLicenserAdd(UserVO userVO) throws Exception;
	
	public List<ReportVO> getLicenserList(ReportVO reportVO) throws Exception;
	
	public Long getReportListCount(ReportPager reportPager) throws Exception;
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================결재신청 insert===================
	
	public void setAddVaca(ReportVacaVO reportVacaVO) throws Exception;
	
	public void setAddWork(ReportWorkVO reportWorkVO) throws Exception;
	
	public void setAddPay(ReportPayVO reportPayVO) throws Exception;
	
	public void setAddSorry(ReportSorryVO reportSorryVO) throws Exception;
	
	public void setAddApply(ReportApplyVO reportApplyVO) throws Exception;

	
	//================================================
	
	//=======================최근호===================
	
	
	public Integer getLicenseCheck(ReportVO reportVO) throws Exception;
	
	public ReportVacaVO getLicenseVacaReportDetail(ReportVacaVO reportVacaVO) throws Exception;
	
	public ReportWorkVO getLicenseWorkReportDetail(ReportWorkVO reportWorkVO) throws Exception;
	
	public ReportPayVO getLicensePayReportDetail(ReportPayVO reportPayVO) throws Exception;
	
	public ReportSorryVO getLicenseSorryReportDetail(ReportSorryVO reportSorryVO) throws Exception;
	
	public ReportVO getFinishReport(ReportApplyVO reportApplyVO) throws Exception;
	
	public ReportVO getReturnsReport(ReportApplyVO reportApplyVO) throws Exception;
	
	public ReportVO getDoFirstReport(ReportApplyVO reportApplyVO) throws Exception;
	
	public ReportVO getDoFinalReport(ReportApplyVO reportApplyVO) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	public List<ReportVacaVO> getMyVacaList(ReportPager pager) throws Exception;
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception;
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception;
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception;
	
	public ReportVacaVO getMyVacaDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportPayVO getMyPayDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportWorkVO getMyWorkDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportSorryVO getMySorryDetail(ReportApplyVO reportApplyVO) throws Exception;
	//================================================
	
}
