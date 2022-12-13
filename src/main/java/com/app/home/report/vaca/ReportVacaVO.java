package com.app.home.report.vaca;

import java.sql.Date;

import com.app.home.report.ReportApplyVO;

public class ReportVacaVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applyNum;
	private Long categoryNum;
	private String categoryName;
	private String text;
	private String period;
	private Integer call;
	private Date date;
	
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
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Integer getCall() {
		return call;
	}
	public void setCall(Integer call) {
		this.call = call;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
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
