
package com.app.home.report;

import java.sql.Date;

import com.app.home.report.util.ReportPager;
import com.app.home.user.UserVO;

import lombok.Data;

public class ReportApplyVO extends ReportPager {
	 private Long applyNum;
	 private int id;
	 private int depNum;
	 private int reportNum;
	 private int status;
	 private int returns;
	 private Date apDate;
	   
	 private String name;
	 private String depName;
	 private String roleName;
	 
	 private UserVO userVO;
	 
	 public Long getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(Long applyNum) {
		this.applyNum = applyNum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDepNum() {
		return depNum;
	}

	public void setDepNum(int depNum) {
		this.depNum = depNum;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getReturns() {
		return returns;
	}

	public void setReturns(int returns) {
		this.returns = returns;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getlStatus() {
		return lStatus;
	}

	public void setlStatus(int lStatus) {
		this.lStatus = lStatus;
	}

	private int lStatus;
}
