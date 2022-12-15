package com.app.home.board.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	// 댓글 번호 PK
	private Integer commentNum;
	// 게시글 번호
	private Integer num;
	//작성자
	private Integer id;
	//댓글 내용
	private String contents;
	//날짜 
	private Timestamp regDate;
	//수정날짜 
	private Timestamp updateDate;

}
