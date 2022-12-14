package com.app.home.board;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.home.file.FileVO;

import lombok.Data;

@Data
public class BoardVO {

	private Integer num; // Auto_increment PK
	private Integer id; //사원번호
	private String title; //제목
	private String contents; //내용
	private Integer depnum; // 부서번호, 요청게시판에서만 사용.
	private Integer hit; //조회수
	private Integer sort; // 게시판 구분자 - 1: 공지사항 2:요청게시판 3:익명게시판
	private Timestamp regDate; //등록일자
	private Timestamp updateDate; //수정일자
	private MultipartFile[] multipartFiles;
	private List<FileVO> fileVOs;
	
	private Integer cntComment;


}
