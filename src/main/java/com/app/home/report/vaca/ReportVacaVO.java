package com.app.home.report.vaca;

import java.sql.Date;
import java.time.LocalDate;

import com.app.home.report.ReportApplyVO;
import com.app.home.user.UserVO;

public class ReportVacaVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applyNum;
	private Long categoryNum;
	private String categoryName;
	private String text;
	private String startDate;
	private String endDate;
	private Long call;
	private String date;
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Long getRnum() {
		return rnum;
	}
	public void setRnum(Long rnum) {
		this.rnum = rnum;
	}
	public Long getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(Long applyNum) {
		this.applyNum = applyNum;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Long getCall() {
		return call;
	}
	public void setCall(Long call) {
		this.call = call;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
	
}
