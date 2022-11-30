package com.app.home.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileManageService {

	@Autowired
	private FileDAO fileDAO;
	
	public FileVO getFileDetail(FileVO fileVO)throws Exception{
		return fileDAO.getFileDetail(fileVO);
	}
}
