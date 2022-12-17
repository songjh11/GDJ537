package com.app.home.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.app.home.file.FileVO;

import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.model.CompleteMultipartUploadResponse;
import software.amazon.awssdk.services.s3.model.DeleteObjectResponse;

@Component
@Slf4j
public class FileManager extends AbstractView {

	@Value("${app.file.base}")
	private String base; //파일 다운로드와 저장, 삭제 시 사용

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		log.info("==fileDownloadView==");
		FileVO fileVO = (FileVO)model.get("fileVO");
		String path = (String)model.get("path");
		File file = new File(base+path, fileVO.getFileName());

		//한글 처리
		response.setCharacterEncoding("UTF-8");

		//총 파일의 크기
		response.setContentLengthLong(file.length());

		//다운로드시 파일의 이름을 인코딩
		String fileOriName = URLEncoder.encode(fileVO.getOriName(), "UTF-8");

		//header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileOriName+"\"");
		response.setHeader("content-Transfer-Encoding", "binary");

		//HDD에서 파일을 읽고
		FileInputStream fi = new FileInputStream(file);

		//Client로 전송 준비
		OutputStream os = response.getOutputStream();

		//전송
		FileCopyUtils.copy(fi, os);

		//자원 해제
		os.close();
		fi.close();

	}

	public String saveFile(MultipartFile multipartFile, String path)throws Exception {

		//0. 저장경로에 폴더(directory)가 없으면 만든다.
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}

		//1. 중복되지 않는 파일명 생성(UUID, Date)
		String boardFileName = UUID.randomUUID().toString();

		//2. 확장자
		StringBuffer bf = new StringBuffer();
		bf.append(boardFileName);

		//파일명과 확장자 분리
		String ex = multipartFile.getOriginalFilename();
		ex = ex.substring(ex.lastIndexOf("."));

		//bf.append(multipartFile.getOriginalFilename());
		bf.append(ex);

		boardFileName = bf.toString();

		//3. File 저장
		file = new File(path, bf.toString());

		// MultipartFile
		multipartFile.transferTo(file);

		return boardFileName;
	}

	public String saveFileS3(MultipartFile multipartFile)throws Exception {

		//amazons3Service 객체를 만든다.
		AmazonS3Service amazonS3Service = new AmazonS3Service();
		
		RequestBody requestBody = RequestBody.fromInputStream(multipartFile.getInputStream(), multipartFile.getSize());

		//1. 중복되지 않는 파일명 생성(UUID, Date)
		String boardFileName = UUID.randomUUID().toString();
		//파일명과 확장자 분리
		String ex = multipartFile.getOriginalFilename();
		ex = ex.substring(ex.lastIndexOf("."));
		StringBuffer bf = new StringBuffer(boardFileName);
		bf.append(ex);
		boardFileName = bf.toString();

		CompleteMultipartUploadResponse rr = amazonS3Service.upload(requestBody, boardFileName, "gdj537-yeyey");
		
		
		return rr.key();//오브젝트 키 리턴
	}
	
	//파일 삭제//
	public boolean deleteFileS3(FileVO fileVO)throws Exception{

		AmazonS3Service amazonS3Service = new AmazonS3Service();
		
		

		DeleteObjectResponse dr = amazonS3Service.delete(fileVO.getFileName(), "gdj537-yeyey");
		
		log.info("drr{}",dr.deleteMarker());
		return dr.deleteMarker();
	}
	

	
	public String saveFile(String path,ServletContext servletContext,MultipartFile multipartFile) throws Exception{
		

		
		
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();	
		}
		
		String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
		
		file = new File(file,fileName);
		multipartFile.transferTo(file);
		
		
		return fileName;
	}

	//파일 삭제//
	public boolean deleteFile(FileVO fileVO)throws Exception{

		File file = new File(base , fileVO.getFileName());

		boolean result = file.delete();

		return result;
	}
	
	//파일 사이즈 계산
	public String calFileSize(MultipartFile file)throws Exception{
		long byte1 = file.getSize();
		double kb = byte1 / 1024.0;
		double mb = kb / 1024.0;
		double gb = mb / 1024.0;
		
		String filesize = byte1 +"byte";
		if(byte1 > 1000) {
			filesize = Math.round(kb * 100) / 100.0 + "kb";
			if(kb > 1000) {
				filesize = Math.round(mb * 100) / 100.0  + "mb";
			}
		}
		return filesize;
	}
}
