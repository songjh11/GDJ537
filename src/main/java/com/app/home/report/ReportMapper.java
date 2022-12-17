package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.beans.factory.annotation.Autowired;



import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.pay.RepriceVO;
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
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO) throws Exception;
	
	public List<UserVO> getReportList(UserVO userVO) throws Exception;
	
	public int setLicenserAdd(UserVO userVO) throws Exception;
	
	public List<ReportVO> getLicenserList(ReportVO reportVO) throws Exception;
	
	public Long getReportListCount(ReportPager reportPager) throws Exception;
	
	public int setLicenserUpdate(UserVO userVO) throws Exception;
	
	//신청자입장에서 자기가 첫번째(팀장) 결재선 
	public UserVO getFirstList(UserVO userVO) throws Exception;
	
	//신청자입장에서 자기가 두번째(최종결재관리자) 결재선
	public UserVO getlastlist(UserVO userVO) throws Exception;
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================결재신청 insert===================
	
	public int setAddVaca(ReportVacaVO reportVacaVO) throws Exception;
	
	public int setAddWork(ReportWorkVO reportWorkVO) throws Exception;
	
	public int setAddPay(ReportPayVO reportPayVO) throws Exception;
	
	public int setAddSorry(ReportSorryVO reportSorryVO) throws Exception;
	
	public int setAddApply(ReportApplyVO reportApplyVO) throws Exception;

	public int setAddItem(RepriceVO repriceVO) throws Exception;
	//================================================
	
	//=======================최근호===================
	
	

			public int setUpdateApply(ReportApplyVO reportApplyVO) throws Exception;
			
			public int setUpdateCancelApply(ReportApplyVO reportApplyVO) throws Exception;
			
			public Integer getLicenseCheck(ReportVO reportVO) throws Exception;
			
			public ReportVacaVO getLicenseVacaReportDetail(ReportVacaVO reportVacaVO) throws Exception;
			
			public ReportWorkVO getLicenseWorkReportDetail(ReportWorkVO reportWorkVO) throws Exception;
			
			public ReportPayVO getLicensePayReportDetail(ReportPayVO reportPayVO) throws Exception;
			
			public ReportSorryVO getLicenseSorryReportDetail(ReportSorryVO reportSorryVO) throws Exception;
			
			public ReportVO getFinishReport(ReportPager reportPager) throws Exception;
			
			public Long getCountFinishReport(ReportPager reportPager) throws Exception;
			
			public ReportVO getReturnReport(ReportPager reportPager) throws Exception;
			
			public Long getCountReturnReport(ReportPager reportPager) throws Exception;
			
			public ReportVO getDoFirstReport(ReportPager reportPager) throws Exception;
			
			public Long getCountDoFirstReport(ReportPager reportPager) throws Exception;
			
			public List<ReportApplyVO> getDoFinalReport(ReportPager reportPager) throws Exception;
			
			public Long getCountDoFinalReport(ReportPager reportPager) throws Exception;
			
			public List<ReportApplyVO> getAdminReturnReport(ReportPager reportPager) throws Exception;
			
			public Long getCountAdminReturnReport(ReportPager reportPager) throws Exception;
			
			public List<ReportApplyVO> getAdminFinishReport(ReportPager reportPager) throws Exception;

			public Long getCountAdminFinishReport(ReportPager reportPager) throws Exception;

	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	public List<ReportVacaVO> getMyVacaList(ReportPager pager) throws Exception;
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception;
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception;
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception;
	
	public Long getMyVacaCount(ReportPager pager) throws Exception;
	public Long getMyWorkCount(ReportPager pager) throws Exception;
	public Long getMySorryCount(ReportPager pager) throws Exception;
	public Long getMyPayCount(ReportPager pager) throws Exception;
	
	public ReportVacaVO getMyVacaDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportPayVO getMyPayDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportWorkVO getMyWorkDetail(ReportApplyVO reportApplyVO) throws Exception;
	public ReportSorryVO getMySorryDetail(ReportApplyVO reportApplyVO) throws Exception;
	public Integer getLstatus(Integer id) throws Exception;
	//================================================
	
}
