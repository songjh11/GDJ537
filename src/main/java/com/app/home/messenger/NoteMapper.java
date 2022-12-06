package com.app.home.messenger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoteMapper {
	
	public List<NoteVO> getReceiveNoteList()throws Exception;
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception;
	

}
