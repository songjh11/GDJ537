package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.pay.RepriceVO;
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
	public int setWorkReport(ReportWorkVO reportWorkVO)throws Exception{
		int result = reportMapper.setWorkReport(reportWorkVO);
		return result;
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO, UserVO userVO) throws Exception{
		
		
//		int result = reportMapper.setLicenserAdd(userVO);
//		
//		if(result > 0) {
//			reportMapper.setLstatusUpdate(reportVO);
//		}
		
		int result = reportMapper.setLstatusUpdate(reportVO);
		
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
		
	//승인자 테이블에서 권한을 회수하기 위해 delete
	public int setLicenserUpdate(UserVO userVO) throws Exception{
		
		return reportMapper.setLicenserUpdate(userVO);
	}
	
	//결재 신청자 입장에서 자기가 결재를 해야할 목록 리스트
	public ReportVO getFirstList(ReportVO reportVO) throws Exception{
			
		
		return reportMapper.getFirstList(reportVO);
	}
	
	//결재 신청자 입장에서 자기가 결재를 해야할 목록 리스트
	public ReportVO getlastlist(ReportVO reportVO) throws Exception{
		
		return reportMapper.getlastlist(reportVO);
	}
	
	
	
	
	
	//================================================
	
	
	//=======================결재 신청 insert===================
	
	
	public int setAddVaca(ReportVacaVO reportVacaVO) throws Exception{
		reportMapper.setAddApply(reportVacaVO);
		return reportMapper.setAddVaca(reportVacaVO);
	} 
	
	public int setAddWork(ReportWorkVO reportWorkVO) throws Exception{
		reportMapper.setAddApply(reportWorkVO);
		return reportMapper.setAddWork(reportWorkVO);
	}
	
	public int setAddPay(ReportPayVO reportPayVO) throws Exception{
		reportMapper.setAddApply(reportPayVO);
		int result = reportMapper.setAddPay(reportPayVO);
		
		for(RepriceVO repriceVO : reportPayVO.getRepriceVOs()) {
			if(repriceVO.getItem().equals("")) {
				continue;
			}
			repriceVO.setRnum(reportPayVO.getRnum());
			reportMapper.setAddItem(repriceVO);
		}
		
		return result;
	}
	
	public int setAddSorry(ReportSorryVO reportSorryVO) throws Exception{
		reportMapper.setAddApply(reportSorryVO);
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
			
			public ReportVO getFinishReport(ReportPager reportPager) throws Exception{
				reportPager.getNum(reportMapper.getCountFinishReport(reportPager));
				return reportMapper.getFinishReport(reportPager);
			}
			
			public ReportVO getReturnReport(ReportPager reportPager) throws Exception{
				reportPager.getNum(reportMapper.getCountReturnReport(reportPager));
				return reportMapper.getReturnReport(reportPager);
			}
			
			public ReportVO getDoFirstReport(ReportPager reportPager) throws Exception{
				reportPager.getNum(reportMapper.getCountDoFirstReport(reportPager));
				return reportMapper.getDoFirstReport(reportPager);
			}
			
			public ReportVO getDoFinalReport(ReportPager reportPager) throws Exception{
				reportPager.getNum(reportMapper.getCountDoFinalReport(reportPager));
				return reportMapper.getDoFinalReport(reportPager);
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
