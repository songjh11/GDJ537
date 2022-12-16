package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.EmployeeVO;

@Mapper
public interface PickMapper {
	
	public int firstCheckPick(String myId) throws Exception;
	
	public Long findPicknum(String myId) throws Exception;

	public int createPick(String myId) throws Exception;
	
	public int setPick(Map<String, Object> map) throws Exception;
	
	public List<EmployeeVO> getPickList(String myId) throws Exception;
	
	public int perCheck(Map<String, Object> map) throws Exception;
	
	public int pickCancel(Map<String, Object> map) throws Exception;
}
