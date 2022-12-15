package com.app.home.board.unknown;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.board.BoardDAO;
import com.app.home.board.BoardVO;
import com.app.home.file.FileDAO;
import com.app.home.file.FileVO;
import com.app.home.util.FileManager;
import com.app.home.util.Pager;

@Service
public class UnknownService {

	@Autowired
	private BoardDAO boardDAO;

	@Value("${app.file.base.board}")
	private String path;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FileDAO fileDAO;

	public int setUnknownDelete(BoardVO boardVO) throws Exception{
		int result = boardDAO.setDelete(boardVO);

		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	public int setUnknownUpdate(BoardVO boardVO) throws Exception{
		int result = boardDAO.setUpdate(boardVO);

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

	public BoardVO getUnknownDetail(BoardVO boardVO) throws Exception {
		return boardDAO.getDetail(boardVO);
	}

	@Transactional(rollbackFor = Exception.class)
	public int setUnknownAdd(BoardVO boardVO) throws Exception {
		boardVO.setSort(3);

		int result = boardDAO.setBoard(boardVO);

		if(result == 1 && boardVO.getMultipartFiles() != null) {
			for(MultipartFile file : boardVO.getMultipartFiles()) {
				if(!file.isEmpty()) {
					FileVO fileVO = new FileVO();
					String fileName = fileManager.saveFile(file, path);
					fileVO.setFileName(fileName);
					fileVO.setNum(boardVO.getNum());
					fileVO.setOriName(file.getOriginalFilename());

					int result2 = fileDAO.setFile(fileVO);
				}
			}
		}

		return result;
	}

	public List<BoardVO> getUnknownList(Pager pager) throws Exception {

		Long totalCount = boardDAO.getTotalCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();

		return boardDAO.getList(pager);
	}

	public int setHit(BoardVO boardVO) throws Exception {
		return boardDAO.setHit(boardVO);
	}

}
