package com.app.home.messenger;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("messenger")
@Slf4j
public class MessengerController {
	
	@Autowired
	private NoteService noteService;

	@Autowired
	private MessengerService messengerService;
	
	@GetMapping("chat")
	public ModelAndView getMyChat(HttpSession session)throws Exception{
		int id = 1;
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<EmployeeVO> el = messengerService.getEmpList();
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		return mv;
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
	
	
	//-----------
	
	@GetMapping("chat1")
	public ModelAndView chat()throws Exception{
		ModelAndView mv= new ModelAndView();
	
		mv.setViewName("messenger/chat1");
		return mv;
	}

	@GetMapping("chatroom")
	public ModelAndView chat3()throws Exception{
		ModelAndView mv= new ModelAndView();
	
		mv.setViewName("messenger/chatroom");
		return mv;
	}

	
}



