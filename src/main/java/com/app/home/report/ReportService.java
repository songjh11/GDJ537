package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
import com.app.home.user.UserVO;

@Service
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	

	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO, UserVO userVO) throws Exception{
		
		
		int result = reportMapper.setLicenserAdd(userVO);
		
		if(result > 0) {
			reportMapper.setLstatusUpdate(reportVO);
		}
		
		return result;
	}
	
	public List<UserVO> getReportList (UserVO userVO) throws Exception{
		
		return reportMapper.getReportList(userVO);
	}
	
	public List<ReportVO> getLicenserList(ReportVO reportVO) throws Exception{
		
		return reportMapper.getLicenserList(reportVO);
	}
	
//	public int setLicenserAdd(UserVO userVO) throws Exception{
//		
//		return reportMapper.setLicenserAdd(userVO);
//	}
//	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	public ReportPayVO selectPay(ReportPayVO reportPayVO) throws Exception{
		return reportMapper.selectPay(reportPayVO);
	}
	
	public ReportSorryVO selectSorry(ReportSorryVO reportSorryVO) throws Exception{
		return reportMapper.selectSorry(reportSorryVO);
	}
	
	
	//================================================
	
	
	//=======================최근호===================
	
	

	public Integer getLicenseCheck(ReportVO reportVO) throws Exception{
			return reportMapper.getLicenseCheck(reportVO);
	}
		
	public ReportApplyVO getLicenseSorryReportDetail(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getLicenseSorryReportDetail(reportApplyVO);
	}
		
	public ReportApplyVO getLicensePayReportDetail(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getLicensePayReportDetail(reportApplyVO);
		}
		
	public ReportApplyVO getLicenseWorkReportDetail(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getLicenseWorkReportDetail(reportApplyVO);
	}
		
	public ReportApplyVO getLicenseVacaReportDetail(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getLicenseVacaReportDetail(reportApplyVO);
	}
		
	public ReportVO getFinishReport(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getFinishReport(reportApplyVO);
	}
		
	public ReportVO getReturnReport(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getReturnsReport(reportApplyVO);
	}
		
	public ReportVO getDoFirstReport(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getDoFirstReport(reportApplyVO);
	}
		
	public ReportVO getDoFinalReport(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.getDoFinalReport(reportApplyVO);
	}
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	public List<ReportVacaVO> getMyVacaList(ReportPager pager) throws Exception{
		return reportMapper.getMyVacaList(pager);
	}
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception{
		return reportMapper.getMyWorkList(pager);
	}
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception{
		return reportMapper.getMySorryList(pager);
	}
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception{
		return reportMapper.getMyPayList(pager);
	}
	
	public ReportVacaVO getMyVacaDetail(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.getMyVacaDetail(reportApplyVO);
	}
	public ReportPayVO getMyPayDetail(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.getMyPayDetail(reportApplyVO);
	}
	public ReportWorkVO getMyWorkDetail(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.getMyWorkDetail(reportApplyVO);
	}
	public ReportSorryVO getMySorryDetail(ReportApplyVO reportApplyVO) throws Exception{
		return reportMapper.getMySorryDetail(reportApplyVO);
	}
	
	//================================================
}
