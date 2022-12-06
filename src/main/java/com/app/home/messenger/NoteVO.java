package com.app.home.messenger;

import java.sql.Date;

import lombok.Data;

@Data
public class NoteVO {
	
	private Long noteNum;
	private Long sendId;
	private Long receiveId;
	private String contents;
	private Date regDate;
	private int readCheck;
	
}
