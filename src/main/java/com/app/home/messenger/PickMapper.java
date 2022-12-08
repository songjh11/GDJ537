package com.app.home.messenger;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PickMapper {
	
	public int firstCheckPick(String myId) throws Exception;
	
	public Long findPickNum(String myId) throws Exception;

	public int createPick(String myId) throws Exception;
	
	public int setPick(Map<String, Object> map) throws Exception;
	
	
}
