package com.app.home.report.vaca;

import java.sql.Date;

import com.app.home.report.ReportApplyVO;

public class ReportVacaVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applynum;
	private Long category;
	private String text;
	private String period;
	private Long call;
	private Date date;
	
	public Long getRnum() {
		return rnum;
	}
	public void setRnum(Long rnum) {
		this.rnum = rnum;
	}
	public Long getApplynum() {
		return applynum;
	}
	public void setApplynum(Long applynum) {
		this.applynum = applynum;
	}
	public Long getCategory() {
		return category;
	}
	public void setCategory(Long category) {
		this.category = category;
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
	public Long getCall() {
		return call;
	}
	public void setCall(Long call) {
		this.call = call;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
