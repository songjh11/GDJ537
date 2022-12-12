package com.app.home.messenger;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MessengerService {

	@Autowired
	private MessengerMapper messengerMapper; 
	
	public List<EmployeeVO> getEmpList () throws Exception{
		return messengerMapper.getEmpList();
	}
	
	public List<DepartmentVO> getDepList() throws Exception{
		return messengerMapper.getDepList();
	}
	
	public List<EmployeeVO> getSearchResult (Map<String, String> map) throws Exception{
		return messengerMapper.getSearchResult(map); 
	}
	
	public int setAddRoom(RoomVO roomVO)throws Exception{
		
		log.info("방장 아이디 => {} ", roomVO.getHostId());
		
		List<EmployeeVO> ar = roomVO.getEmployeeVOs();
		
		for(EmployeeVO employeeVO2 : ar) {
			log.info("유저가있니? => {} ",employeeVO2.getId());
		}
		
		return 1;
	}
	
}
