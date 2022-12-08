package com.app.home.messenger;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PickMapper {
	
	public int firstCheckPick(String myId) throws Exception;

	public int createPick(String myId) throws Exception;
	
	public int setPick() throws Exception;
	
	
}
