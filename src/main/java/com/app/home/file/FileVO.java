package com.app.home.file;


import lombok.Data;

@Data
public class FileVO {

	private Integer id;	//PK
	private Integer boardId;	//게시판 ID
	private String fileName;
	private String oriName;
	private Integer fileSize;
}
