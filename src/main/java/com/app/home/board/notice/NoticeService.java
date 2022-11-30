package com.app.home.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.board.BoardDAO;
import com.app.home.board.BoardVO;
import com.app.home.file.FileDAO;
import com.app.home.file.FileVO;
import com.app.home.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private BoardDAO boardDAO;
	@Value("${app.file.base.board}")
	private String path;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FileDAO fileDAO;
	
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
		
		if(result == 1 && boardVO.getMultipartFiles() !=null) {
			for(MultipartFile file : boardVO.getMultipartFiles()) {
				if(file.getOriginalFilename()!="") {
					FileVO fileVO = new FileVO();
					String fileName = fileManager.saveFile(file, path);
					fileVO.setFileName(fileName);
					fileVO.setOriName(file.getOriginalFilename());
					fileVO.setNum(boardVO.getNum());
					
					int result2 =fileDAO.setFile(fileVO);
				}
			}
		}

		
		return result;
	}
	
	public BoardVO getDetail(BoardVO boardVO) throws Exception{
		boardVO = boardDAO.getDetail(boardVO);
		
		return boardVO;
	}

}
