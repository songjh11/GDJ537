package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

@Mapper
public interface MessengerMapper {

	public List<EmployeeVO> getEmpList () throws Exception;
	
	public List<DepartmentVO> getDepList() throws Exception;
	
	public List<EmployeeVO> getSearchResult (Map<String, String> map) throws Exception;
	
	public int setAddRoom(RoomVO roomVO)throws Exception;
	
	public int setAddRoomUser(RoomVO roomVO)throws Exception;
	
	public List<RoomVO> getRoomList()throws Exception;
	
	
}
