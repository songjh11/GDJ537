package com.app.home.report.pay;

import java.sql.Date;
import java.util.List;

import com.app.home.report.ReportApplyVO;

public class ReportPayVO extends ReportApplyVO {
	
	private Long rnum;
	private Long applynum;
	private String title;
	private String cdate;
	private Long sum;
	private String payment;
	private Date date;
	private String depName;
	private List<RepriceVO> repriceVOs;
	
	
	
	public List<RepriceVO> getRepriceVOs() {
		return repriceVOs;
	}
	public void setRepriceVOs(List<RepriceVO> repriceVOs) {
		this.repriceVOs = repriceVOs;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public Long getSum() {
		return sum;
	}
	public void setSum(Long sum) {
		this.sum = sum;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
