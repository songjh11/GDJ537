package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.UserVO;

@Mapper
public interface PickMapper {
	
	//중복체크
	public int firstCheckPick(Map<String, Object> map) throws Exception;
	
	public Long findPickNum(String myId) throws Exception;

	public int createPick(String myId) throws Exception;
	
	public int setPick(Map<String, Object> map) throws Exception;
	
	public List<UserVO> getPickList(String myId) throws Exception;
	
	public int perCheck(Map<String, Object> map) throws Exception;
	
	public int pickCancel(Map<String, Object> map) throws Exception;
}
