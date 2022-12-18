package com.app.home.report;


import java.security.Principal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.pay.RepriceVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
import com.app.home.user.DepartmentVO;
import com.app.home.user.UserMapper;
import com.app.home.user.UserService;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ReportMapper reportMapper;
	@Autowired
	private UserService userService;
	
	
	//=======================김도영===================
	@GetMapping("/kdy/reportAdd")
	public ModelAndView reportAdd(ReportApplyVO reportApplyVO, Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		if(principal == null) {
//			mv.setViewName("user/login");
//			return mv;
//		}
		
		mv.setViewName("kdy/reportAdd");
		
		return mv;
	}
	//휴가신청서
	@GetMapping("/kdy/vacationApplication")
	public ModelAndView vacationApplication(Principal principal)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		log.info("principal :: {} " , principal);
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
		
		log.info("userVO :::: {} " ,userVO);
		ModelAndView mv = new ModelAndView();

		
		
		List<UserVO> ar = reportService.getReportList(userVO);
//		model.addAttribute("reportPager", userVO);
//		log.info("dddd ====>>>> {}", reportPager.getStartNum());
		
		log.info("lstatus ==== > {} " , ar.get(0));
		
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
	public int setLstatusUpdate(String depNum, ReportVO reportVO, UserVO userVO, Model model,HttpServletRequest request , RedirectAttributes redirectAttributes) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		

//		int result1 = reportService.setLicenserAdd(userVO);

		int count = reportService.getGrantorCount(reportVO);
		int result = 0;
		log.info("count :: {} ",count);
		
		if(count == 0) {				//부여를 누르려는 부서에 승인자가 이미 있다면 
			result = reportService.setLstatusUpdate(reportVO, userVO);
		}else{						//부여를 누르려는 부서에 승인자가 없다면
			log.info("이지원돼지");
			
//			model.addAttribute("msg", "이미 승인자가 있습니다.");
//			model.addAttribute("url", "/");
			
			//request.setAttribute("msg", "이미 승인자가 있습니다");
			
			mv.addObject("msg", "이미 승인자가 있습니다");
			mv.addObject("url", "/");
			mv.setViewName("/report/alert");
			
			log.info("이지원꿀꿀");
			
			//mv.setViewName("/report/alert");
			return count;
			
		}
		
		
//		int result = reportService.setLstatusUpdate(reportVO, userVO);
		//log.info("아이디 : {} " , userVO.getId());
		//log.info("depNum : {} ", reportVO.getDepNum());
		
//		model.addAttribute("result", result);
		mv.addObject("count", count);
//		mv.addObject("result", result);
//		mv.addObject("result1", result1);
//		mv.addObject("UserVO", userVO);
//		mv.addObject("ReportVO", reportVO);
//		
		mv.setViewName("report/insa");
		
		return count;
	}
	
	
	
	//승인권한을 가진사람 모두 보는 리스트 목록
	@RequestMapping(value = "/report/licenserList", method = RequestMethod.GET)
	public ModelAndView getLicenserList(ReportVO reportVO, UserVO userVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ReportVO> ar = reportService.getLicenserList(reportVO);
//		
//		log.info("roleName :: {} ", ar.get(ar.).getRoleVO().getRoleName());
		
//		String str = ar.get(ar.size()).getRoleVO().getRoleName();
		
		// 예를들어 ROLE_ADMIN => ROLE_을 파싱해서 ADMIN만 추출
//		for(ReportVO str: ar) {
//			str.getRoleVO().setRoleName(str.getRoleVO().getRoleName().substring(5));
//			log.info("auth {} " ,str.getRoleVO().getRoleName().substring(5));
//		}
		
		
		
		log.info("내 승인자 테이블 아이디 :: {} " , reportVO.getId());
//		log.info("내 승인자 테이블 이름 :: {} " , reportVO.getUserVO().getName());
		
		mv.addObject("list", ar);
		mv.setViewName("/report/licenserList");
		
		return mv;
	}
	
	
	//승인자 테이블에서 권한을 다시 회수하기 위해 lstatus == 0으로 만듬
	@RequestMapping(value = "/report/deleteLicenser", method = RequestMethod.POST)
	@ResponseBody
	public ReportVO setLicenserUpdate(String depNum, String id, UserVO userVO, ReportVO reportVO, Model model) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		ReportVO reportVO2 = new ReportVO();
		
		int count = reportService.getGrantorCount(reportVO);
		int result = 0;
		log.info("count :: {} ",count);
		
		reportVO2 = reportService.getLicenserId(reportVO);
		if(reportVO2 != null) {	//승인자라면
			
			result = reportService.setLicenserUpdate(userVO);
		}else{						//부여를 누르려는 부서에 승인자가 없다면
			
			}
		
//		if(count >= 1) {				//부여를 누르려는 부서에 승인자가 이미 있다면 선택한 사람의 lstatus == 0으로 업데이트
//		}else if(count == 0){						//부여를 누르려는 부서에 승인자가 없다면
//			log.info("이지원돼지");
//			
//			log.info("이지원꿀꿀");
//			
//			//mv.setViewName("/report/alert");
//			return count;
//		}
		
		model.addAttribute("result", result);
		mv.addObject("reportVO2", reportVO2);
//		mv.addObject("count", count);
		
		return reportVO2;
	}
	
	
	//신청자 입장에서 결재받을 사람 나오게 하기
//	@RequestMapping(method = RequestMethod.GET, value = "/report/reportMyPage")
//	@ResponseBody
//	public ModelAndView getReportMyPage(UserVO userVO, Principal principal, HttpSession session, ReportVO reportVO) throws Exception{
//		
//		ModelAndView mv = new ModelAndView();
//		
//		log.info("맴버 마이페이지 정보 =====>>>> {} ", userVO);
//		log.info("프린시펄 ::: {} " ,principal);
//		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
//	    Authentication authentication = context.getAuthentication();
//	    userVO  =(UserVO)authentication.getPrincipal();
//		
//	    int id = Integer.parseInt(principal.getName());
//	    
//	    
//	    reportVO.setId(id);
//	    reportVO.setDepNum(userVO.getDepNum());
//	    
//	    
//	    ReportVO reportVO2 = new ReportVO();
//	    ReportVO reportVO3 = new ReportVO();
//	    reportVO = reportMapper.getFirstList(reportVO);
//	    
//	    
//	    reportVO2 = reportMapper.getlastlist(reportVO2);
//	    
//	    log.info("prpr :: {} " ,id);
//	    log.info("뎁뎁넘넘 ::: {} " ,userVO.getDepNum());
////	    log.info("뎁네임 ::: {} " , userVO.getDepartmentVO().getDepName());
//	    
//		UserVO userVO2= new UserVO();
//		userVO2 = userService.getMypage(userVO);
//		log.info("로그인한 자신의 마이페이지 :: {} " , userVO2);
////		log.info("내 롤네임 ::: {} " ,userVO2.getRoleVO().getRoleName());
////		log.info("1111111 :: {}" ,reportVO.getDepName());
////		log.info("222222::: {}" , reportVO2.getDepName());
////		log.info("333333:: {} ", reportVO2.getDepartmentVO().getDepName());
////		log.info("44444 :: {} " ,reportVO.getDepartmentVO().getDepName());
//		
////		log.info(reportVO.getDepName()); 
//
//		if(userVO2.getDepNum() == reportVO.getUserVO().getDepNum() && userVO.getRoleNum() == reportVO.getRoleNum()) {
//			log.info("조건만족");
//			reportMapper.getFirstList(reportVO3);
//			reportMapper.getlastlist(reportVO3);
//		}
//		
//		
//
//		mv.addObject("reportVO", reportVO);
//		mv.addObject("reportVO2", reportVO2);
//		mv.addObject("reportVO3", reportVO3);
//		mv.setViewName("/report/reportMyPage");
//		
//		return mv;
//	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/report/reportMyPage")
	public ModelAndView getFirstList(String depNum, Principal principal, UserVO userVO, ReportVO reportVO, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  = (UserVO)authentication.getPrincipal();
		
	    int id = Integer.parseInt(principal.getName());
	    userVO.setId(id);
	    
	    log.info("데엡넘 ::: {} " , userVO.getDepNum());
	    UserVO userVO2 = new UserVO();
	    UserVO userVO3 = new UserVO();
	    
	    
		userVO = reportMapper.getFirstList(userVO);	//나의 첫번째 승인자 리스트를 띄움
		userVO2 = reportMapper.getlastlist(userVO);	//나의 최종승인자 리스트를 띄움
		userVO3 = userService.getMypage(userVO3);	// 마이페이지를 불러서 회원정보의 모든것을 userVO3에 가져옴
		
//		log.info("ID ::::: {} " , userVO.getId());
//		log.info("depNum :::::: {} " , userVO.getDepNum());
		
		
		mv.addObject("userVO", userVO);
		mv.addObject("userVO2", userVO2);
		mv.addObject("userVO3", userVO3);
		
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================결재신청 insert===================
	
	
	@PostMapping("/report/addvaca")
	public String setAddVaca(String depNum, ReportVacaVO reportVacaVO, Principal principal) throws Exception{
		
		int result = reportService.setAddVaca(reportVacaVO);
		
		return "redirect:/report/mylist?cat=2";
	} 
	
	@PostMapping("/report/addwork")
	public String setAddWork(ReportWorkVO reportWorkVO, Principal principal) throws Exception{
		
		int result = reportService.setAddWork(reportWorkVO);
		
		return "redirect:/report/mylist?cat=3";
	}
	
	@PostMapping("/report/addpay")
	public String setAddPay(ReportPayVO reportPayVO, Principal principal) throws Exception{
		
		int result = reportService.setAddPay(reportPayVO);
		
		return "redirect:/report/mylist?cat=1";
	}
	
	@PostMapping("/report/addsorry")
	public String setAddSorry(ReportSorryVO reportSorryVO, Principal principal) throws Exception{

		
		int result = reportService.setAddSorry(reportSorryVO);
		
		return "redirect:/report/mylist?cat=4";
	}
	
	
	//================================================
	
	
	//=======================최근호===================

	@PostMapping("/report/updateapply")
	@ResponseBody
	public int setUpdateApply(ReportApplyVO reportApplyVO) throws Exception{
		log.info("mmmmmmmmmmmmmmmmmmmmmmmmmmmmm:{}",reportApplyVO.getApplyNum());
		log.info("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnn:{}",reportApplyVO.getLstatus());
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
	public ModelAndView getLicenseVacaReportDetail(ReportVacaVO reportVacaVO,String lstatus) throws Exception{
		ModelAndView mv = new ModelAndView();
		reportVacaVO = reportService.getLicenseVacaReportDetail(reportVacaVO);
		Date date = reportVacaVO.getDate();
		String a = date.toString();
		String[] b = a.split("-");
		String year = b[0];
		String month = b[1];
		String day = b[2];
		
		
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", day);
		mv.addObject("reportVacaVO", reportVacaVO);
		mv.addObject("result", lstatus);
		return mv;
	}
	
	@GetMapping("/report/workdetail")
	public ModelAndView getLicenseWorkReportDetail(ReportWorkVO reportWorkVO,String lstatus) throws Exception{
		ModelAndView mv = new ModelAndView();
		reportWorkVO = reportService.getLicenseWorkReportDetail(reportWorkVO);
		Date date = reportWorkVO.getDate();
		String a = date.toString();
		String[] b = a.split("-");
		String year = b[0];
		String month = b[1];
		String day = b[2];
		
		
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", day);
		mv.addObject("reportWorkVO", reportWorkVO);
		mv.addObject("result", lstatus);
		return mv;
	}
	
	@GetMapping("/report/paydetail")
	public ModelAndView getLicensePayReportDetail(ReportPayVO reportPayVO,String lstatus) throws Exception{
		ModelAndView mv = new ModelAndView();
		reportPayVO = reportService.getLicensePayReportDetail(reportPayVO);
		List<RepriceVO> rePriceVOs = reportPayVO.getRepriceVOs();
		Date date = reportPayVO.getDate();
		String a = date.toString();
		String[] b = a.split("-");
		String year = b[0];
		String month = b[1];
		String day = b[2];
		
		
		mv.addObject("rePriceVOs", rePriceVOs);	
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", day);
		mv.addObject("reportPayVO", reportPayVO);
		mv.addObject("result", lstatus);
		return mv;
	}
	
	@GetMapping("/report/sorrydetail")
	public ModelAndView getLicenseSorryReportDetail(ReportSorryVO reportSorryVO,String lstatus) throws Exception{
		ModelAndView mv = new ModelAndView();
		reportSorryVO = reportService.getLicenseSorryReportDetail(reportSorryVO);
		Date date = reportSorryVO.getDate();
		String a = date.toString();
		String[] b = a.split("-");
		String year = b[0];
		String month = b[1];
		String day = b[2];
		
		
								
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.addObject("day", day);
		mv.addObject("reportSorryVO", reportSorryVO);
		mv.addObject("result", lstatus);
		return mv;
	}
	
	
	@GetMapping("/report/doreport")
	public ModelAndView getDoReport(Principal principal,String cat,ReportPager reportPager) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(principal == null) {
			mv.setViewName("/user/login");
			return mv;
		}
		String id = principal.getName();
		int num = Integer.parseInt(id);
		int category = 0;
		if(cat != null) {
			category = Integer.parseInt(cat);
		}
		if(reportPager.getKind() == "") {
			reportPager.setKind("1"); 
		}
		
		ReportVO reportVO = new ReportVO();
		reportPager.setId(num);
		reportVO.setId(num);
		reportPager.setReportNum(category);
		mv.addObject("cat", category);
		Integer check = reportService.getLicenseCheck(reportVO);
		log.info("ffffffffffffffffffffffffffffffff:{}",check);
		log.info("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn:{}",reportPager.getKind());
		if(check == 0) {
			String message = "승인자만 볼수 있습니다.";
			String url = "/";
			mv.addObject("message", message);
			mv.addObject("url", url);
			mv.setViewName("report/redirect");
			return mv;
	}
	else if (check == 2){
			if(reportPager.getKind().equals("2")) {
				reportVO = reportService.getFinishReport(reportPager);
				if(reportVO != null) {
					List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
					mv.addObject("reportApplyVOs", reportApplyVOs);		
				}
				mv.addObject("pager", reportPager);
				mv.setViewName("report/doreport");
				return mv;
			}
			else if(reportPager.getKind().equals("3")) {						
				reportVO = reportService.getReturnReport(reportPager);
				if(reportVO != null) {
					List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
					mv.addObject("reportApplyVOs", reportApplyVOs);					
				}
				mv.addObject("pager", reportPager);
				mv.setViewName("report/doreport");
				return mv;
			}
			else {
				log.info("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
				reportVO = reportService.getDoFirstReport(reportPager);
				if(reportVO != null) {

					List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
					mv.addObject("reportApplyVOs", reportApplyVOs);					
				}
				mv.addObject("reportVO",reportVO);
				mv.addObject("pager", reportPager);
				mv.setViewName("report/doreport");
				return mv;

				

			}
	}
		else {
			log.info("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
			if(reportPager.getKind().equals("2")) {
				List<ReportApplyVO> reportApplyVOs = reportService.getAdminFinishReport(reportPager);
				mv.addObject("reportApplyVOs", reportApplyVOs);					
				mv.addObject("pager", reportPager);
				mv.setViewName("report/adminreport");
				return mv;
			}
			else if(reportPager.getKind().equals("3")) {						
				List<ReportApplyVO> reportApplyVOs = reportService.getAdminReturnReport(reportPager);
				mv.addObject("reportApplyVOs", reportApplyVOs);					
				mv.addObject("pager", reportPager);
				mv.setViewName("report/adminreport");
				return mv;
			}
			else {
				log.info("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
				List<ReportApplyVO> reportApplyVOs = reportService.getDoFinalReport(reportPager);
				mv.addObject("reportApplyVOs", reportApplyVOs);			
				mv.addObject("pager", reportPager);
				mv.setViewName("report/adminreport");
				return mv;
			}
		}
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	@GetMapping("/report/mylist")
	public ModelAndView getMyReportList(ModelAndView mv,String cat,ReportPager pager, Principal principal) throws Exception{
		
		if(principal == null) {
			mv.setViewName("user/login");
			return mv;
		}
		
		pager.setId(Integer.parseInt(principal.getName()));
		
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
	public ModelAndView getMyReportDetail(ModelAndView mv,ReportApplyVO reportApplyVO, Principal principal) throws Exception{
		
		if(principal == null) {
			mv.setViewName("user/login");
			return mv;
		}
		
		reportApplyVO.setId(Integer.parseInt(principal.getName()));
		
		int result = reportApplyVO.getReportNum();
		
		if(result == 1) {
			ReportVacaVO reportVacaVO = reportService.getMyVacaDetail(reportApplyVO);
			Date date = reportVacaVO.getDate();
			String a = date.toString();
            String[] b = a.split("-");
            String year = b[0];
            String month = b[1];
            String day = b[2];         
            mv.addObject("year", year);
            mv.addObject("month", month);
            mv.addObject("day", day);
			
			mv.addObject("vo", reportVacaVO);
		}else if(result == 2) {
			ReportWorkVO reportWorkVO = reportService.getMyWorkDetail(reportApplyVO);
			Date date = reportWorkVO.getDate();
			String a = date.toString();
            String[] b = a.split("-");
            String year = b[0];
            String month = b[1];
            String day = b[2];         
            mv.addObject("year", year);
            mv.addObject("month", month);
            mv.addObject("day", day);
			
			mv.addObject("vo", reportWorkVO);
		}else if(result == 3) {
			ReportPayVO reportPayVO = reportService.getMyPayDetail(reportApplyVO);
			log.info("목록 : {}", reportPayVO.getRepriceVOs());
			Date date = reportPayVO.getDate();
			String a = date.toString();
            String[] b = a.split("-");
            String year = b[0];
            String month = b[1];
            String day = b[2];         
            mv.addObject("year", year);
            mv.addObject("month", month);
            mv.addObject("day", day);
			
			
			mv.addObject("vo", reportPayVO);
		}else if(result == 4) {
			ReportSorryVO reportSorryVO = reportService.getMySorryDetail(reportApplyVO);
			Date date = reportSorryVO.getDate();
			String a = date.toString();
            String[] b = a.split("-");
            String year = b[0];
            String month = b[1];
            String day = b[2];         
            mv.addObject("year", year);
            mv.addObject("month", month);
            mv.addObject("day", day);
			
			
			mv.addObject("vo", reportSorryVO);
		}
		
		mv.setViewName("report/mydetail");
		
		return mv;
		
	}
	
	
	//================================================
	
}
