package com.app.home.board.comment;

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
	//날짜 timestamp 지저분해짐
	private String regDate;
	//수정날짜 timestamp 지저분해짐
	private String updateDate;

}
