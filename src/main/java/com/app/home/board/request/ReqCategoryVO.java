package com.app.home.board.request;

import com.app.home.user.DepartmentVO;

import lombok.Data;

@Data
public class ReqCategoryVO {

	private  int id;
	private String categoryName;
	private String categoryForm;
	private int depNum;
	
	private DepartmentVO DepartmentVO;
	
}
