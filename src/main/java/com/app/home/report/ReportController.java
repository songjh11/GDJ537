package com.app.home.report;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	//권한수정 페이지 GET
	@RequestMapping(method = RequestMethod.GET, value="/report/insa")
	public ModelAndView setLstatusUpdate(UserVO userVO, ReportVO reportVO, ModelAndView mv) throws Exception{
		
		
		
		
		userVO.setId(2209);						//로그인을 가정해서 아이디를 세팅해줌
		userVO.setDepNum(userVO.getDepNum());	//jsp 드롭다운에서 부서를 고르면 그에 해당하는 depNum이 세팅됨
		userVO.setRoleNum(userVO.getRoleNum());	//jsp 드롭다운에서 직급을 고르면 그에 해당하는 roleNum이 세팅됨
		reportVO.setLstatus(2);	
		
		mv.addObject("userVO", userVO);
		mv.setViewName("report/insa");
		
		
		return mv;
	}
	
	//권한수정 페이지 POST
	@RequestMapping(value = "/report/insa", method = RequestMethod.POST)
	public ModelAndView setLstatusUpdate(ReportVO reportVO, UserVO userVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		userVO.setId(2209);
		userVO.setName("hjs1");
		userVO.setRoleNum(3);	//과장급 roleNum
		
		
		mv.addObject("UserVO", userVO);
		mv.addObject("ReportVO", reportVO);
		
		mv.setViewName("report/insa");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
}
