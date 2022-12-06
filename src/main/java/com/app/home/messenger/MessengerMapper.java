package com.app.home.messenger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

@Mapper
public interface MessengerMapper {

	public List<EmployeeVO> getEmpList () throws Exception;
	
	public List<DepartmentVO> getDepList() throws Exception;
}
