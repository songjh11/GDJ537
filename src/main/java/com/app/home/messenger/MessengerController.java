package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("messenger")
public class MessengerController {
	
	@Autowired
	private NoteService noteService;

	@GetMapping("chat")
	public void getMyChat()throws Exception{
		
	}
	
	@GetMapping("note")
	public ModelAndView getReceiveNoteList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NoteVO> ar = noteService.getReceiveNoteList();
		
		mv.addObject("list", ar);
		return mv;
		
	}
	
	@GetMapping("note/detail")
	public ModelAndView getNoteDetail(NoteVO noteVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noteVO = noteService.getNoteDetail(noteVO);
		mv.addObject("detail", noteVO);
		mv.setViewName("messenger/note/detail");
		return mv;
	}



















}



