package com.app.home.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;

@Service
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
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
	
	//================================================
}
