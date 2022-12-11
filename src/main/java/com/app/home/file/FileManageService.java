package com.app.home.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.util.FileManager;

@Service
public class FileManageService {

	@Autowired
	private FileDAO fileDAO;
	@Autowired
	private FileManager fileManager;
	
	public FileVO getFileDetail(FileVO fileVO)throws Exception{
		return fileDAO.getFileDetail(fileVO);
	}
	
	public int setFileDelete(FileVO fileVO, String path)throws Exception{
		fileVO = fileDAO.getFileDetail(fileVO);
		int result = 0;
		
		if(fileVO!=null) {
			result = fileDAO.setFileDelete(fileVO);
			
			boolean result2 = fileManager.deleteFile(fileVO, path);
		}
		
		
		return result;
	}
}
