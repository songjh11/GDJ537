package com.app.home.messenger;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoteVO {
	
	private Long noteNum;
	private int sendId;
	private int receiveId;
	private String contents;
	private Timestamp regDate;
	private int readCheck;
	private String receiveName;
	private String sendName;
	private int remark;
	private int flag;
	
}
