package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

@Service
public class MessengerService {

	@Autowired
	private MessengerMapper messengerMapper; 
	
	public List<EmployeeVO> getEmpList () throws Exception{
		return messengerMapper.getEmpList();
	}
	
	public List<DepartmentVO> getDepList() throws Exception{
		return messengerMapper.getDepList();
	}
	
}
