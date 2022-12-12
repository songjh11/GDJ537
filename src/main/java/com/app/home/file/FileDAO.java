package com.app.home.file;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileDAO {

	public int setFile(FileVO fileVO)throws Exception;

	public FileVO getFileDetail(FileVO fileVO)throws Exception;

	public int setFileDelete(FileVO fileVO)throws Exception;
}
