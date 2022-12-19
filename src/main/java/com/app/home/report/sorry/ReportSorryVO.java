package com.app.home.report.sorry;

import java.sql.Date;

import com.app.home.report.ReportApplyVO;

public class ReportSorryVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applynum;
	private Date date;
	private String text;
	private Long order;
	
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Long getOrder() {
		return order;
	}
	public void setOrder(Long order) {
		this.order = order;
	}
	
	
	
}
