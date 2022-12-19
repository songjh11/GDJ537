package com.app.home.board.comment;

import java.sql.Timestamp;

import com.app.home.user.UserVO;

import lombok.Data;

@Data
public class CommentVO {
	
	// 댓글 번호 PK
	private Integer id;
	// 게시글 번호
	private Integer boardId;
	//작성자
	private Integer creator;
	
	//댓글 내용
	private String contents;
	//날짜 
	private Timestamp regDate;
	//수정날짜 
	private Timestamp updateDate;
	
	private UserVO userVO;

}
