package com.app.home.user;

import java.sql.Date;

import com.app.home.messenger.PickVO;

import lombok.Data;

@Data
public class EmployeeVO {

	private int num;
	private int id;
	private int roleNum;
	private int depNum;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Date entDate;
	private String profile;
	private int status;
	
	private RoleVO roleVO;
	private DepartmentVO departmentVO; 
	private PickVO pickVO;
}
