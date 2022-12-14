package com.app.home.report;


import java.security.Principal;
import java.time.LocalDate;
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
import com.app.home.user.DepartmentVO;
import com.app.home.user.UserMapper;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserMapper userMapper;

	
	//=======================김도영===================
	@GetMapping("/kdy/reportAdd")
	public ModelAndView reportAdd(ReportApplyVO reportApplyVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int reportApply = reportService.setReportApply(reportApplyVO);
		mv.addObject("reportApply", reportApply);
		return mv;
	}
	//휴가신청서
	@GetMapping("/kdy/vacationApplication")
	public ModelAndView vacationApplication(Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(principal.getName());
		
		
		//현재시간 구하기========================
		LocalDate now = LocalDate.now();
								
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", dayOfMonth);
		//===================================
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO = userMapper.getMypage(userVO);
		mv.addObject("vo", userVO);
		mv.setViewName("/kdy/vacationApplication");
		
		return mv;
	}
	//업무보고서
	@GetMapping("/kdy/workReport")
	public ModelAndView workReport(Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(principal.getName());
		
		//현재시간 구하기========================
		LocalDate now = LocalDate.now();
								
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", dayOfMonth);
		//===================================
		
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO = userMapper.getMypage(userVO);
		mv.addObject("vo", userVO);
		mv.setViewName("/kdy/workReport");
		
		
		return mv;
	}
	//지출 결의서
	@GetMapping("/kdy/cashDisbursementVoucher")
	public ModelAndView cashDisbursementVoucher(Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(principal.getName());
		
		//현재시간 구하기========================
		LocalDate now = LocalDate.now();
						
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
						
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", dayOfMonth);
		//===================================
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO = userMapper.getMypage(userVO);
		mv.addObject("vo", userVO);
		mv.setViewName("/kdy/cashDisbursementVoucher");
		
		return mv;
	}
	//시말서
	@GetMapping("/kdy/writtenApology")
	public ModelAndView writtenApology(Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(principal.getName());
		
		//현재시간 구하기========================
		LocalDate now = LocalDate.now();
								
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", dayOfMonth);
		//===================================
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO = userMapper.getMypage(userVO);
		mv.addObject("vo", userVO);
		mv.setViewName("/kdy/writtenApology");
		
		return mv;
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
	public List<UserVO> getReportList1(UserVO userVO, Model model) throws Exception{
//		UserVO userVO = new UserVO();
		
		
		ModelAndView mv = new ModelAndView();

		
		
		List<UserVO> ar = reportService.getReportList(userVO);
//		model.addAttribute("reportPager", userVO);
//		log.info("dddd ====>>>> {}", reportPager.getStartNum());
		
		
		
//		log.info("depNum :: {} " , ar.get(0).getDepartmentVO().getDepName());

		
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
//		
//		log.info("roleName :: {} ", ar.get(ar.).getRoleVO().getRoleName());
		
//		String str = ar.get(ar.size()).getRoleVO().getRoleName();
		
		for(ReportVO str: ar) {
			str.getRoleVO().setRoleName(str.getRoleVO().getRoleName().substring(5));
			log.info("auth {} " ,str.getRoleVO().getRoleName().substring(5));
		}
		
		
		
		log.info("내 승인자 테이블 아이디 :: {} " , reportVO.getId());
//		log.info("내 승인자 테이블 이름 :: {} " , reportVO.getUserVO().getName());
		
		mv.addObject("list", ar);
		mv.setViewName("/report/licenserList");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================결재신청 insert===================
	
	
	@PostMapping("/report/addvaca")
	public String setAddVaca(ReportVacaVO reportVacaVO) throws Exception{
		int result = reportService.setAddVaca(reportVacaVO);
		
		return "redirect:/report/mylist?cat=2";
	} 
	
	@PostMapping("/report/addwork")
	public String setAddWork(ReportWorkVO reportWorkVO) throws Exception{
		int result = reportService.setAddWork(reportWorkVO);
		
		return "redirect:/report/mylist?cat=3";
	}
	
	@PostMapping("/report/addpay")
	public String setAddPay(ReportPayVO reportPayVO) throws Exception{
		int result = reportService.setAddPay(reportPayVO);
		
		return "redirect:/report/mylist?cat=1";
	}
	
	@PostMapping("/report/addsorry")
	public String setAddSorry(ReportSorryVO reportSorryVO) throws Exception{
		int result = reportService.setAddSorry(reportSorryVO);
		
		return "redirect:/report/mylist?cat=4";
	}
	
	
	//================================================
	
	
	//=======================최근호===================
	
	

	@PostMapping("/report/updateapply")
		@ResponseBody
		public int setUpdateApply(ReportApplyVO reportApplyVO) throws Exception{
			int result = reportService.setUpdateApply(reportApplyVO);
			return result;
		}
		
		@PostMapping("/report/updatecancelapply")
		@ResponseBody
		public int setUpdateCancelApply(ReportApplyVO reportApplyVO) throws Exception{
			int result = reportService.setUpdateCancelApply(reportApplyVO);
			return result;
		}
		
		@GetMapping("/report/vacadetail")
		public ModelAndView getLicenseVacaReportDetail(ReportVacaVO reportVacaVO,String result) throws Exception{
			ModelAndView mv = new ModelAndView();
			reportVacaVO = reportService.getLicenseVacaReportDetail(reportVacaVO);
			mv.addObject("reportVacaVO", reportVacaVO);
			mv.addObject("result", result);
			return mv;
		}
		
		@GetMapping("/report/workdetail")
		public ModelAndView getLicenseWorkReportDetail(ReportWorkVO reportWorkVO,String result) throws Exception{
			ModelAndView mv = new ModelAndView();
			reportWorkVO = reportService.getLicenseWorkReportDetail(reportWorkVO);
			mv.addObject("reportWorkVO", reportWorkVO);
			mv.addObject("result", result);
			return mv;
		}
		
		@GetMapping("/report/paydetail")
		public ModelAndView getLicensePayReportDetail(ReportPayVO reportPayVO,String result) throws Exception{
			ModelAndView mv = new ModelAndView();
			reportPayVO = reportService.getLicensePayReportDetail(reportPayVO);
			mv.addObject("reportPayVO", reportPayVO);
			mv.addObject("result", result);
			return mv;
		}
		
		@GetMapping("/report/sorrydetail")
		public ModelAndView getLicenseSorryReportDetail(ReportSorryVO reportSorryVO,String result) throws Exception{
			ModelAndView mv = new ModelAndView();
			reportSorryVO = reportService.getLicenseSorryReportDetail(reportSorryVO);
			mv.addObject("reportSorryVO", reportSorryVO);
			mv.addObject("result", result);
			return mv;
		}
		
		@GetMapping("/report/finishreport")
		public ModelAndView getFinishReport(Principal principal,String cat) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(principal == null) {
				mv.setViewName("/user/login");
				return mv;
			}
//			String id = principal.getName();
//			int num = Integer.parseInt(id);
			int category = Integer.parseInt(cat);
			ReportVO reportVO = new ReportVO();
//			reportVO.setId(num);
			ReportApplyVO reportApplyVO = new ReportApplyVO();
			reportApplyVO.setReportNum(category);
//			reportApplyVO.setId(num);
//			Integer check = reportService.getLicenseCheck(reportVO);
//			if(check == 0) {
//				String message = "승인자만 볼수 있습니다.";
//				String url = "/";
//				mv.addObject("message", message);
//				mv.addObject("url", url);
//				mv.setViewName("redirect:report/redirect");
//				return mv;
//			}
//			else{
				reportVO = reportService.getFinishReport(reportApplyVO);
				List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
				mv.addObject("reportApplyVOs", reportApplyVOs);
				mv.setViewName("report/finishreport");
				return mv;
			//}
		}
		
		@GetMapping("/report/returnreport")
		public ModelAndView getReturnReport(Principal principal,String cat) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(principal == null) {
				mv.setViewName("/user/login");
				return mv;
			}
//			String id = principal.getName();
//			int num = Integer.parseInt(id);
			int category = Integer.parseInt(cat);
			ReportVO reportVO = new ReportVO();
//			reportVO.setId(num);
			ReportApplyVO reportApplyVO = new ReportApplyVO();
			reportApplyVO.setReportNum(category);
//			reportApplyVO.setId(num);
//			Integer check = reportService.getLicenseCheck(reportVO);
//			if(check == 0) {
//				String message = "승인자만 볼수 있습니다.";
//				String url = "/";
//				mv.addObject("message", message);
//				mv.addObject("url", url);
//				mv.setViewName("report/redirect");
//				return mv;
//			}
//			else{
				reportVO = reportService.getReturnReport(reportApplyVO);
				List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
				mv.addObject("reportApplyVOs", reportApplyVOs);
				mv.setViewName("report/returnreport");
				return mv;
			//}
		}
		
		@GetMapping("/report/doreport")
		public ModelAndView getDoReport(Principal principal,String cat) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(principal == null) {
				mv.setViewName("/user/login");
				return mv;
			}
			//String id = principal.getName();
			//int num = Integer.parseInt(id);
			int category = Integer.parseInt(cat);
			ReportVO reportVO = new ReportVO();
//			reportVO.setId(num);
			ReportApplyVO reportApplyVO = new ReportApplyVO();
			reportApplyVO.setReportNum(category);
//			reportApplyVO.setId(num);
//			Integer check = reportService.getLicenseCheck(reportVO);
//			if(check == 0) {
//				String message = "승인자만 볼수 있습니다.";
//				String url = "/";
//				mv.addObject("message", message);
//				mv.addObject("url", url);
//				mv.setViewName("report/redirect");
//				return mv;
//			}
//			else if(check == 2) {
//				reportVO = reportService.getDoFirstReport(reportApplyVO);
//				List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
//				mv.addObject("reportApplyVOs", reportApplyVOs);
//				mv.setViewName("report/doreport");
//				return mv;
//			}
//			else{
				reportVO = reportService.getDoFinalReport(reportApplyVO);
				int result = reportVO.getLstatus();
				List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
				mv.addObject("reportApplyVOs", reportApplyVOs);
				mv.addObject("result", result);
				mv.setViewName("report/doreport");
				return mv;
			//}
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
		
		mv.addObject("pager", pager);
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
