package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.EmployeeVO;

@Service
public class NoteService {
	
	@Autowired
	private NoteMapper noteMapper;
	
	public int setSendNote(NoteVO noteVO)throws Exception{
		return noteMapper.setSendNote(noteVO);
	}
	
	public List<NoteVO> getSendNoteList(EmployeeVO employeeVO)throws Exception {
		return noteMapper.getSendNoteList(employeeVO);
	}
	
	public List<NoteVO> getReceiveNoteList(EmployeeVO employeeVO)throws Exception {
		return noteMapper.getReceiveNoteList(employeeVO);
	}
	
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception {
		return noteMapper.getNoteDetail(noteVO);
	}

}
