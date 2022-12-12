package com.app.home.report.work;

import java.sql.Date;

import com.app.home.report.ReportApplyVO;

public class ReportWorkVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applyNum;
	private Date date;
	private String am;
	private String pm;
	private String undo;
	private String todo;
	private String wrong;
	private String etc;
	
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAm() {
		return am;
	}
	public void setAm(String am) {
		this.am = am;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getUndo() {
		return undo;
	}
	public void setUndo(String undo) {
		this.undo = undo;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
	}
	public String getWrong() {
		return wrong;
	}
	public void setWrong(String wrong) {
		this.wrong = wrong;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
	
	
}
