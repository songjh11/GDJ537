package com.app.home.board;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.home.file.FileVO;
import com.app.home.user.UserVO;

import lombok.Data;

@Data
public class BoardVO {

	private Integer id; // Auto_increment PK
	private Integer creator; //사원번호
	private String title; //제목
	private String contents; //내용
	private Integer depnum; // 부서번호, 요청게시판에서만 사용.
	private Integer hit; //조회수
	private String sort; // 게시판 구분자 - 공지: 공지사항 요청:요청게시판 익명:익명게시판
	private Timestamp regDate; //등록일자
	private Timestamp updateDate; //수정일자
	private Integer updater;	//수정자
	private MultipartFile[] multipartFiles;
	private List<FileVO> fileVOs;
	
	private Integer cntComment;
	
	private UserVO userVO;


}
