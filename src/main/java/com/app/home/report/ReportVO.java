
package com.app.home.report;

import java.sql.Date;
import java.util.List;

import com.app.home.report.util.ReportPager;
import com.app.home.user.DepartmentVO;
import com.app.home.user.RoleVO;
import com.app.home.user.UserVO;

import lombok.Data;

@Data
public class ReportVO extends ReportPager {
	
	private int licenserNum;
	private int depNum;
	private int id;
	private int lstatus;
	

	private List<ReportApplyVO> reportApplyVOs;
	private UserVO userVO;
	private List<UserVO> userVOs;
	private DepartmentVO departmentVO;
	private RoleVO roleVO;
	
	
	
	
}
