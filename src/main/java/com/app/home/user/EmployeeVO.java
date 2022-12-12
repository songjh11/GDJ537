package com.app.home.user;

import java.sql.Date;
import java.util.List;

import com.app.home.messenger.PickVO;
import com.app.home.messenger.RoomVO;

import lombok.Data;

@Data
public class EmployeeVO {

	private int num;
	private int id;
	private int depNum;
	private int roleNum;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Date entDate;
	private String profile;
	private String status;
	
	private RoleVO roleVO;
	private DepartmentVO departmentVO; 
	private PickVO pickVO;
	
}
