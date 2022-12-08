package com.app.home.messenger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.user.EmployeeVO;

@Mapper
public interface NoteMapper {

	public int setSendNote(NoteVO noteVO)throws Exception;
	public List<NoteVO> getSendNoteList(EmployeeVO employeeVO)throws Exception;
	public List<NoteVO> getReceiveNoteList(EmployeeVO employeeVO)throws Exception;
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception;
	

}
