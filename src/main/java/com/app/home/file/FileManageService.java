package com.app.home.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.util.AmazonS3Service;
import com.app.home.util.FileManager;

import software.amazon.awssdk.services.s3.model.DeleteObjectResponse;

@Service
public class FileManageService {

	@Autowired
	private FileDAO fileDAO;
	@Autowired
	private FileManager fileManager;

	public FileVO getFileDetail(FileVO fileVO)throws Exception{
		return fileDAO.getFileDetail(fileVO);
	}

	//파일삭제는 여기서
	public int setFileDelete(FileVO fileVO)throws Exception{
		fileVO = fileDAO.getFileDetail(fileVO);
		int result = 0;

		if(fileVO!=null) {
			result = fileDAO.setFileDelete(fileVO);

			boolean result2 = fileManager.deleteFile(fileVO);
		}


		return result;
	}
	
	public int setFileDeleteS3(FileVO fileVO)throws Exception{
		System.out.println("managerService");
		fileVO = fileDAO.getFileDetail(fileVO);
		int result = 0;

		if(fileVO!=null) {
			AmazonS3Service amazonS3Service = new AmazonS3Service();
			
			result = fileDAO.setFileDelete(fileVO);

			DeleteObjectResponse result2 = amazonS3Service.delete(fileVO.getFileName(), "gdj537-yeyey");
			System.out.println("delete result "+ result2.deleteMarker());			
		}


		return result;
	}
}
