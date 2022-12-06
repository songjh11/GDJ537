package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoteService {
	
	@Autowired
	private NoteMapper noteMapper;
	
	public List<NoteVO> getReceiveNoteList()throws Exception {
		return noteMapper.getReceiveNoteList();
	}
	
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception {
		return noteMapper.getNoteDetail(noteVO);
	}

}
