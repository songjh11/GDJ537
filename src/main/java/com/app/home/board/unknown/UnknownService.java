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

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
					String fileName = fileManager.saveFileS3(file);
					fileVO.setFileName(fileName);
					fileVO.setOriName(file.getOriginalFilename());
					
					long byte1 = file.getSize();
					double kb = byte1 / 1024.0;
					double mb = kb / 1024.0;
					double gb = mb / 1024.0;
					log.info("byte {} ,   kb   {},   mb   {}, gb    {}", byte1, kb, mb, gb);
					
					String filesize = byte1 +"byte";
					
					if(byte1 > 1000) {
						filesize = Math.round(kb * 100) / 100 + "kb";
						if(mb > 1000) {
							filesize = Math.round(mb * 100) / 100  + "mb";
							if(gb > 1000) {
								filesize = gb +"gb";
							}
						}
					}
					
					fileVO.setFileSize(filesize);
					fileVO.setBoardId(boardVO.getId());

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
		boardVO.setSort("익명");

		int result = boardDAO.setBoard(boardVO);

		if(result == 1 && boardVO.getMultipartFiles() != null) {
			for(MultipartFile file : boardVO.getMultipartFiles()) {
				if(!file.isEmpty()) {
					FileVO fileVO = new FileVO();
					String fileName = fileManager.saveFileS3(file);
					fileVO.setFileName(fileName);
					fileVO.setBoardId(boardVO.getId());
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
