package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface NoteMapper {

	public int setSendNote(NoteVO noteVO)throws Exception;
	public List<NoteVO> getSendNoteList(Map<String, Object> map)throws Exception;
	public Long getSendNoteListCount(Map<String, Object> map)throws Exception;
	public List<NoteVO> getReceiveNoteList(Map<String, Object> map)throws Exception;
	public Long getReceiveNoteListCount(Map<String, Object> map)throws Exception;
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception;
	

}
