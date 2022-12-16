package com.app.home.report;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportApplyVO {
	 private Long applynum;
	 private int id;
	 private int depnum;
	 private int reportnum;
	 private int status;
	 private int returns;
	 private Date apDate;
	   
	 private String name;
	 private String depName;
	 private String roleName;
}
