package com.app.home.messenger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoteService {
	
	@Autowired
	private NoteMapper noteMapper;
	
	public int setSendNote(NoteVO noteVO)throws Exception{
		return noteMapper.setSendNote(noteVO);
	}
	
	public List<NoteVO> getSendNoteList(EmployeeVO employeeVO, NotePager notePager)throws Exception {
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("id", employeeVO.getId());
		countMap.put("search", notePager.getSearch());
		countMap.put("kind", notePager.getKind());
		
		Long totalCount = noteMapper.getSendNoteListCount(countMap);
		notePager.getRowNum();
		notePager.getNum(totalCount);
		notePager.setPerPage(10L);
		

		log.info("============= : {}", totalCount);
		log.info("==============토탈페이지 : {}", notePager.getTotalPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", employeeVO.getId());
		map.put("startRow", notePager.getStartRow());
		map.put("perPage", notePager.getPerPage());
		map.put("search", notePager.getSearch());
		map.put("kind", notePager.getKind());
		
		return noteMapper.getSendNoteList(map);
	}
	
	public List<NoteVO> getReceiveNoteList(EmployeeVO employeeVO, NotePager notePager)throws Exception {
		
		//카운트 매퍼용 맵
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("id", employeeVO.getId());
		countMap.put("search", notePager.getSearch());
		countMap.put("kind", notePager.getKind());
		
		Long totalCount = noteMapper.getReceiveNoteListCount(countMap);
		notePager.getRowNum();
		notePager.getNum(totalCount);
		notePager.setPerPage(10L);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", employeeVO.getId());
		map.put("startRow", notePager.getStartRow());
		map.put("perPage", notePager.getPerPage());
		map.put("search", notePager.getSearch());
		map.put("kind", notePager.getKind());
		
		

		
		
		return noteMapper.getReceiveNoteList(map);
	}
	
	public NoteVO getNoteDetail(NoteVO noteVO)throws Exception {
		return noteMapper.getNoteDetail(noteVO);
	}

}
