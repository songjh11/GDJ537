package com.app.home.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.board.BoardDAO;
import com.app.home.board.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public boolean checkValid(BoardVO boardVO) {
		boolean chkId = false;
		boolean chkTitle = false;
		boolean chkContents = false;
		try {
			chkId = boardVO.getId()!=null;
			chkTitle = boardVO.getTitle()!=null;
			chkContents = boardVO.getContents()!=null;			
		}catch(Exception exception) {
			return false;
		}

				
		return chkId&chkTitle&chkContents;
	}
	
	public int setNotice(BoardVO boardVO) throws Exception{
		//sort에 1 (notice) 세팅
		boardVO.setSort(1);
		
		int result = boardDAO.setBoard(boardVO);
		return result;
	}

}
