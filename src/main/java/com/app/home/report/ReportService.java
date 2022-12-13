package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
import com.app.home.user.DepartmentVO;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	

	//=======================김도영===================
	//신청 보고서
	public int setReportApply(ReportApplyVO reportApplyVO)throws Exception{
		int result = reportMapper.setReportApply(reportApplyVO);
		return result;
	}
	//업무 보고서
	public int setWorkReport(WorkReportVO workReportVO)throws Exception{
		int result = reportMapper.setWorkReport(workReportVO);
		return result;
	}
	
	
	
	
	
	
	
	
	
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
		
		/*
		 * Long totalCount = reportMapper.getReportListCount(reportPager);
		 * log.info("cc ===>>> {}", totalCount); reportPager.getNum(totalCount);
		 * reportPager.getStartRow();
		 */

		
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
	
	
	//=======================결재 신청 insert===================
	
	
	public int setAddVaca(ReportVacaVO reportVacaVO) throws Exception{
		return reportMapper.setAddVaca(reportVacaVO);
	} 
	
	public int setAddWork(ReportWorkVO reportWorkVO) throws Exception{
		return reportMapper.setAddWork(reportWorkVO);
	}
	
	public int setAddPay(ReportPayVO reportPayVO) throws Exception{
		return reportMapper.setAddPay(reportPayVO);
	}
	
	public int setAddSorry(ReportSorryVO reportSorryVO) throws Exception{
		return reportMapper.setAddSorry(reportSorryVO);
	}
	
	//================================================
	
	
	//=======================최근호===================
	
	

	

	public int setUpdateApply(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.setUpdateApply(reportApplyVO);
		}
		
		public int setUpdateCancelApply(ReportApplyVO reportApplyVO) throws Exception{
			return reportMapper.setUpdateCancelApply(reportApplyVO);
		}

		public Integer getLicenseCheck(ReportVO reportVO) throws Exception{
			return reportMapper.getLicenseCheck(reportVO);
		}
		
		public ReportSorryVO getLicenseSorryReportDetail(ReportSorryVO reportSorryVO) throws Exception{
			return reportMapper.getLicenseSorryReportDetail(reportSorryVO);
		}
		
		public ReportPayVO getLicensePayReportDetail(ReportPayVO reportPayVO) throws Exception{
			return reportMapper.getLicensePayReportDetail(reportPayVO);
		}
		
		public ReportWorkVO getLicenseWorkReportDetail(ReportWorkVO reportWorkVO) throws Exception{
			return reportMapper.getLicenseWorkReportDetail(reportWorkVO);
		}
		
		public ReportVacaVO getLicenseVacaReportDetail(ReportVacaVO reportVacaVO) throws Exception{
			return reportMapper.getLicenseVacaReportDetail(reportVacaVO);
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
		pager.getNum(reportMapper.getMyVacaCount(pager));
		
		return reportMapper.getMyVacaList(pager);
	}
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception{
		pager.getNum(reportMapper.getMyWorkCount(pager));
		
		return reportMapper.getMyWorkList(pager);
	}
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception{
		pager.getNum(reportMapper.getMySorryCount(pager));
		
		return reportMapper.getMySorryList(pager);
	}
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception{
		pager.getNum(reportMapper.getMyPayCount(pager));
		
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
