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

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReportController {
	
	@Autowired
	private ReportService reportService;

	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
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
		
//		userVO.setId(2209);
//		userVO.setName("hjs1");
//		userVO.setRoleNum(3);	//과장급 roleNum
		
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
	public ModelAndView getLicenserList(ReportVO reportVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ReportVO> ar = reportService.getLicenserList(reportVO);
		
		mv.addObject("list", ar);
		mv.setViewName("/report/licenserList");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	@GetMapping("/reportList")
	public ModelAndView selectList(ReportPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReportVO> ar = reportService.selectList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("/detail")
	public ModelAndView selectDetail(ReportApplyVO reportApplyVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		reportApplyVO = reportService.selectDetail(reportApplyVO);
		mv.addObject("vo", reportApplyVO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@GetMapping("add")
	public String insertList() throws Exception{
		return "/insertList";
	}
	
	@PostMapping("add")
	public String insertList(ReportApplyVO reportApplyVO, RedirectAttributes redirectAttributes)throws Exception{
		
		int result = reportService.insertList(reportApplyVO);
		redirectAttributes.addAttribute("result", result);
		
		return "redirect:./list";
	}
	
	
	//================================================
	
	
	//=======================최근호===================
	
	@GetMapping("/report/finishreport")
	public ModelAndView getFinishReport(Principal principal) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
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
			reportVO = reportService.getFinishReport(reportVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/finishreport");
			return mv;
		}
	}
	
	@GetMapping("/report/returnreport")
	public ModelAndView getReturnReport(Principal principal) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
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
			reportVO = reportService.getReturnReport(reportVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/returnreport");
			return mv;
		}
	}
	
	@GetMapping("/report/doreport")
	public ModelAndView getDoReport(Principal principal) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = principal.getName();
		int num = Integer.parseInt(id);
		ReportVO reportVO = new ReportVO();
		reportVO.setId(num);
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
			reportVO = reportService.getDoFirstReport(reportVO);
			List<ReportApplyVO> reportApplyVOs = reportVO.getReportApplyVOs();
			mv.addObject("reportApplyVOs", reportApplyVOs);
			mv.setViewName("report/doreport");
			return mv;
		}
		else{
			reportVO = reportService.getDoFinalReport(reportVO);
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
	
	
	//================================================
	
}
