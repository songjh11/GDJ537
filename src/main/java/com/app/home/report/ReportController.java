package com.app.home.report;


import java.security.Principal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReportController {
	
	@Autowired
	private ReportService reportService;

	
	//=======================김도영===================
	@GetMapping("/kdy/reportAdd")
	public String reportAdd()throws Exception{
		return "/kdy/reportAdd";
	}
	//휴가신청서
	@GetMapping("/kdy/vacationApplication")
	public String vacationApplication()throws Exception{
		return "/kdy/vacationApplication";
	}
	//업무보고서
	@GetMapping("/kdy/workReport")
	public String workReport()throws Exception{
		return "/kdy/workReport";
	}
	//지출 결의서
	@GetMapping("/kdy/cashDisbursementVoucher")
	public String cashDisbursementVoucher()throws Exception{
		return "/kdy/cashDisbursementVoucher";
	}
	//시말서
	@GetMapping("/kdy/writtenApology")
	public String writtenApology()throws Exception{
		return "/kdy/writtenApology";
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	//부서, 직급을 고르면 조회되는 리스트
	@RequestMapping(method = RequestMethod.GET, value = "/report/insa")
	public ModelAndView getReportList(UserVO userVO) throws Exception{
//		UserVO userVO = new UserVO();
		ModelAndView mv = new ModelAndView();
		

		
		mv.setViewName("report/insa");
		
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/report/insa1")
	@ResponseBody
	public List<UserVO> getReportList1(UserVO userVO) throws Exception{
//		UserVO userVO = new UserVO();

		
		
		List<UserVO> ar = reportService.getReportList(userVO);

		
		return ar;
	}
	
	
	//권한수정 페이지 GET
//	@RequestMapping(method = RequestMethod.GET, value="/report/insa")
//	public ModelAndView setLstatusUpdate(UserVO userVO, ReportVO reportVO, ModelAndView mv) throws Exception{
//		
//		
//		
//		
//		userVO.setId(2209);						//로그인을 가정해서 아이디를 세팅해줌
//		userVO.setDepNum(userVO.getDepNum());	//jsp 드롭다운에서 부서를 고르면 그에 해당하는 depNum이 세팅됨
//		userVO.setRoleNum(userVO.getRoleNum());	//jsp 드롭다운에서 직급을 고르면 그에 해당하는 roleNum이 세팅됨
//		reportVO.setLstatus(2);	
//		
//		mv.addObject("userVO", userVO);
//		mv.setViewName("report/insa");
//		
//		
//		return mv;
//	}
//	
	//권한수정 페이지 POST
	@RequestMapping(value = "/report/insa", method = RequestMethod.POST)
	@ResponseBody
	public int setLstatusUpdate(ReportVO reportVO, UserVO userVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		

//		int result1 = reportService.setLicenserAdd(userVO);


		
		
		int result = reportService.setLstatusUpdate(reportVO, userVO);
		log.info("아이디 : {} " , userVO.getId());
		log.info("depNum : {} ", reportVO.getDepNum());
		
//		mv.addObject("result1", result1);
//		mv.addObject("result", result);
//		mv.addObject("UserVO", userVO);
//		mv.addObject("ReportVO", reportVO);
//		
//		mv.setViewName("report/insa");
		
		return result;
	}
	
	
	
	//승인권한을 가진사람 모두 보는 리스트 목록
	@RequestMapping(value = "/report/licenserList", method = RequestMethod.GET)
	public ModelAndView getLicenserList(ReportVO reportVO, UserVO userVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ReportVO> ar = reportService.getLicenserList(reportVO);
		
		log.info("내 승인자 테이블 아이디 :: {} " , reportVO.getId());
//		log.info("내 승인자 테이블 이름 :: {} " , reportVO.getUserVO().getName());
		
		mv.addObject("list", ar);
		mv.setViewName("/report/licenserList");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================결재신청 insert===================
	
	@GetMapping("/report/addvaca")
	public void setAddVaca() throws Exception{
		
	} 
	
	@GetMapping("/report/addwork")
	public void setAddWork() throws Exception{
		
	}
	
	@GetMapping("/report/addpay")
	public void setAddPay() throws Exception{
		
	}
	
	@GetMapping("/report/addsorry")
	public void setAddSorry() throws Exception{
		
	}
	
	
	
	@PostMapping("/report/addvaca")
	public void setAddVaca(ReportVacaVO reportVacaVO) throws Exception{
		
	} 
	
	@PostMapping("/report/addwork")
	public void setAddWork(ReportWorkVO reportWorkVO) throws Exception{
		
	}
	
	@PostMapping("/report/addpay")
	public void setAddPay(ReportPayVO reportPayVO) throws Exception{
		
	}
	
	@PostMapping("/report/addsorry")
	public void setAddSorry(ReportSorryVO reportSorryVO) throws Exception{
		
	}
	
	
	//================================================
	
	
	//=======================최근호===================
	
	@GetMapping("/report/vacadetail")
	public ModelAndView getLicenseVacaReportDetail(ReportApplyVO reportApplyVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ReportVacaVO reportVacaVO = new ReportVacaVO();
		reportVacaVO = (ReportVacaVO)reportService.getLicenseVacaReportDetail(reportApplyVO);
		mv.addObject("reportVacaVO", reportVacaVO);
		return mv;
	}
	
	@GetMapping("/report/workdetail")
	public ModelAndView getLicenseWorkReportDetail(ReportApplyVO reportApplyVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ReportWorkVO reportWorkVO = new ReportWorkVO();
		reportWorkVO = (ReportWorkVO)reportService.getLicenseWorkReportDetail(reportApplyVO);
		mv.addObject("reportWorkVO", reportWorkVO);
		return mv;
	}
	
	@GetMapping("/report/paydetail")
	public ModelAndView getLicensePayReportDetail(ReportApplyVO reportApplyVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ReportPayVO reportPayVO = new ReportPayVO();
		reportPayVO = (ReportPayVO)reportService.getLicensePayReportDetail(reportApplyVO);
		mv.addObject("reportPayVO", reportPayVO);
		return mv;
	}
	
	@GetMapping("/report/sorrydetail")
	public ModelAndView getLicenseSorryReportDetail(ReportApplyVO reportApplyVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		ReportSorryVO reportSorryVO = new ReportSorryVO();
		reportSorryVO = (ReportSorryVO)reportService.getLicenseSorryReportDetail(reportApplyVO);
		mv.addObject("reportSorryVO", reportSorryVO);
		return mv;
	}
	
	@GetMapping("/report/finishreport")
	public ModelAndView getFinishReport(Principal principal,String cat) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		int category = Integer.parseInt(cat);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
		ReportApplyVO reportApplyVO = new ReportApplyVO();
		reportApplyVO.setReportNum(category);
		reportApplyVO.setId(num);
		Integer check = reportService.getLicenseCheck(reportVO);
		if(check == 0) {
			String message = "승인자만 볼수 있습니다.";
			String url = "/";
			mv.addObject("message", message);
			mv.addObject("url", url);
			mv.setViewName("redirect:report/redirect");
			return mv;
		}
		else{
			reportVO = reportService.getFinishReport(reportApplyVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/finishreport");
			return mv;
		}
	}
	
	@GetMapping("/report/returnreport")
	public ModelAndView getReturnReport(Principal principal,String cat) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		int category = Integer.parseInt(cat);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
		ReportApplyVO reportApplyVO = new ReportApplyVO();
		reportApplyVO.setReportNum(category);
		reportApplyVO.setId(num);
		Integer check = reportService.getLicenseCheck(reportVO);
		if(check == 0) {
			String message = "승인자만 볼수 있습니다.";
			String url = "/";
			mv.addObject("message", message);
			mv.addObject("url", url);
			mv.setViewName("redirect:report/redirect");
			return mv;
		}
		else{
			reportVO = reportService.getReturnReport(reportApplyVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/returnreport");
			return mv;
		}
	}
	
	@GetMapping("/report/doreport")
	public ModelAndView getDoReport(Principal principal,String cat) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		int category = Integer.parseInt(cat);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
		ReportApplyVO reportApplyVO = new ReportApplyVO();
		reportApplyVO.setReportNum(category);
		reportApplyVO.setId(num);
		Integer check = reportService.getLicenseCheck(reportVO);
		if(check == 0) {
			String message = "승인자만 볼수 있습니다.";
			String url = "/";
			mv.addObject("message", message);
			mv.addObject("url", url);
			mv.setViewName("redirect:report/redirect");
			return mv;
		}
		else if(check == 2) {
			reportVO = reportService.getDoFirstReport(reportApplyVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/doreport");
			return mv;
		}
		else{
			reportVO = reportService.getDoFinalReport(reportApplyVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/doreport");
			return mv;
		}
	}
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	@GetMapping("/report/mylist")
	public ModelAndView getMyReportList(ModelAndView mv,String cat,ReportPager pager) throws Exception{
		
		pager.setId(1209);
		
		if(cat.equals("1")){
			List<ReportPayVO> list = reportService.getMyPayList(pager);
			mv.addObject("list", list);
		}else if(cat.equals("2")){
			List<ReportVacaVO> list = reportService.getMyVacaList(pager);
			mv.addObject("list", list);
		}else if(cat.equals("3")) {
			List<ReportWorkVO> list = reportService.getMyWorkList(pager);
			mv.addObject("list", list);
		}else if(cat.equals("4")) {
			List<ReportSorryVO> list = reportService.getMySorryList(pager);
			mv.addObject("list", list);
		}else {
			List<ReportVacaVO> list = reportService.getMyVacaList(pager);
			mv.addObject("list", list);
		}
		
		mv.addObject("cat", cat);
		mv.setViewName("report/mylist");
		
		return mv;
		
	}
	
	@GetMapping("/report/detail")
	public ModelAndView getMyReportDetail(ModelAndView mv,ReportApplyVO reportApplyVO) throws Exception{
		
		reportApplyVO.setId(1209);
		
//		int result = reportApplyVO.getReportNum();
//		
//		if(result == 1) {
//			ReportVacaVO reportVacaVO = reportService.getMyVacaDetail(reportApplyVO);
//			mv.addObject("vo", reportVacaVO);
//		}else if(result == 2) {
//			ReportWorkVO reportWorkVO = reportService.getMyWorkDetail(reportApplyVO);
//			mv.addObject("vo", reportWorkVO);
//		}else if(result == 3) {
//			ReportPayVO reportPayVO = reportService.getMyPayDetail(reportApplyVO);
//			mv.addObject("vo", reportPayVO);
//		}else if(result == 4) {
//			ReportSorryVO reportSorryVO = reportService.getMySorryDetail(reportApplyVO);
//			mv.addObject("vo", reportSorryVO);
//		}
		
		mv.setViewName("report/mydetail");
		
		return mv;
		
	}
	
	
	//================================================
	
}
