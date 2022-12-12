package com.app.home.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.report.pay.ReportPayVO;
import com.app.home.report.sorry.ReportSorryVO;
import com.app.home.report.util.ReportPager;
import com.app.home.report.vaca.ReportVacaVO;
import com.app.home.report.work.ReportWorkVO;
@Mapper
public interface ReportMapper {
	
	
	//=======================김도영===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================한종석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================장민석===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	
	//=======================최근호===================
	
	
	
	
	
	
	
	
	
	
	//================================================
	
	//=======================류형민===================
	
	
	public List<ReportVacaVO> getMyVacaList(ReportPager pager) throws Exception;
	public List<ReportWorkVO> getMyWorkList(ReportPager pager) throws Exception;
	public List<ReportSorryVO> getMySorryList(ReportPager pager) throws Exception;
	public List<ReportPayVO> getMyPayList(ReportPager pager) throws Exception;
	
	
	
	
	//================================================
	
}
