package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

@Controller
@RequestMapping("messenger")
public class MessengerController {
	
	@Autowired
	private NoteService noteService;

	@Autowired
	private MessengerService messengerService;
	
	@GetMapping("chat")
	public ModelAndView getMyChat()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<EmployeeVO> el = messengerService.getEmpList();
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		return mv;
	}
	
	//수신함
	@GetMapping("note")
	public ModelAndView getReceiveNoteList(EmployeeVO employeeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//임시 id
		employeeVO.setId(20221231);

		List<NoteVO> ar = noteService.getReceiveNoteList(employeeVO);
		
		mv.addObject("list", ar);
		return mv;
		
	}
	
	//발신함
	@GetMapping("note/sent")
	@ResponseBody
	public ModelAndView getSendNoteList(EmployeeVO employeeVO)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		//임시 id
		employeeVO.setId(20221231);
		List<NoteVO> ar = noteService.getSendNoteList(employeeVO);
		
		mv.addObject("list", ar);
		return mv;
		
	}
	
	//쪽지 상세
	@GetMapping("note/detail")
	public ModelAndView getNoteDetail(NoteVO noteVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noteVO = noteService.getNoteDetail(noteVO);
		mv.addObject("detail", noteVO);
		mv.setViewName("messenger/note/detail");
		return mv;
	}
	
	//쪽지발송
	@GetMapping("note/send")
	public ModelAndView setSendNote(EmployeeVO employeeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		employeeVO.setId(20221231);
		mv.addObject("member", employeeVO);
		return mv;
	}
	
	@PostMapping("note/send")
	public ModelAndView setSendNote(NoteVO noteVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String message = "";
		int result = noteService.setSendNote(noteVO);
		if(result==1) {
			message = "쪽지가 발송되었습니다.";
		} else {
			message = "쪽지 발송에 실패했습니다.";
		}
		mv.addObject("message", message);
		mv.setViewName("messenger/note/sendAfter");
		return mv;
	}



















}



