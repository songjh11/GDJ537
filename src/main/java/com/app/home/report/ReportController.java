package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	@RequestMapping(method = RequestMethod.GET, value="/hjs/insa")
	public String getGrantUpdatePage() throws Exception{
		
		return "hjs/insa";
	}
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	@GetMapping("/report/mylist")
	public ModelAndView getMyReportList(ModelAndView mv) throws Exception{
//		List<ReportVO> reportVOs = reportService.getMyReportList();
//		
//		mv.addObject("list", reportVOs);
//		mv.setViewName("report/mylist");
		
		return mv;
		
	}
	
	
	
	
	
	
	
	//================================================
	
}
