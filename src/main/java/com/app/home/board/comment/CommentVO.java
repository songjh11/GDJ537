package com.app.home.board.comment;

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

}
