package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	public int setLstatusUpdate(ReportVO reportVO) throws Exception{
		int result = reportMapper.setLstatusUpdate(reportVO);
		
		return result;
	}
	
	public List<UserVO> getReportList (UserVO userVO) throws Exception{
		
		return reportMapper.getReportList(userVO);
	}
	
	public int setLicenserAdd(UserVO userVO) throws Exception{
		
		return reportMapper.setLicenserAdd(userVO);
	}
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	
	
	
	
	
	
	
	
	//================================================
}
