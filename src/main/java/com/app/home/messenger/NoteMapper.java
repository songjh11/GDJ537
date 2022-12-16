package com.app.home.messenger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.UserVO;



@Mapper
public interface NoteMapper {

	public Long getNotReadCount(UserVO userVO)throws Exception;
	public int updateCheck(NoteVO noteVO)throws Exception;
	public int setDeleteNote(NoteVO noteVO)throws Exception;
	public int setSendNote(NoteVO noteVO)throws Exception;
	public int setSendNote2(NoteVO noteVO)throws Exception;
	public List<NoteVO> getSendNoteList(Map<String, Object> map)throws Exception;
	public Long getSendNoteListCount(Map<String, Object> map)throws Exception;
	public List<NoteVO> getReceiveNoteList(Map<String, Object> map)throws Exception;
	public Long getReceiveNoteListCount(Map<String, Object> map)throws Exception;
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception;
	

}
