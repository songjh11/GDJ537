package com.app.home.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	
	public int setBoard(BoardVO boardVO)throws Exception;

}
