package com.app.home.messenger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Autowired
	private PickService pickService;
	
	// DB저장이 아니라 방의 정보를 담아둘 List<RoomVO>를 생성
	List<RoomVO> roomVOs =  new ArrayList<RoomVO>();
	
	static int roomNum = 0;
	
	@GetMapping("chat")
	public ModelAndView getMyChat(HttpSession session)throws Exception{
		Integer id = 10;
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<EmployeeVO> el = messengerService.getEmpList();
		List<EmployeeVO> pl = pickService.getPickList(id.toString());
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		mv.addObject("pickList", pl);
		mv.addObject("message", "all");
		return mv;
	}
	
	@PostMapping("searchEmp")
	public ModelAndView getSearchResult(HttpSession session, String kind, String keyword) throws Exception{
		log.info("keyword:{},kind:{}", keyword, kind);
		int id = 1;
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("kind", kind);
		List<EmployeeVO> el = messengerService.getSearchResult(map);
		log.info("el:{}", el);
		ModelAndView mv = new ModelAndView();
		mv.addObject("myId", id);
		mv.addObject("empList", el);
		mv.addObject("message", "search");
		mv.setViewName("/messenger/chat");
		return mv;
	}
	
	@GetMapping("pickCheck")
	@ResponseBody
	public int setPickCheck (String myId, String yourId) throws Exception{
		int result = pickService.createPick(myId, yourId);
		log.info("result:{}",result);
		return result;
	}
	
	@PostMapping("pickCancel")
	@ResponseBody
	public int pickCancel (String myId, String yourId) throws Exception{
		int result = pickService.pickCancel(myId, yourId);
		log.info("result:{}",result);
		return result;
	}
	
	//수신함
	@GetMapping("note")
	public ModelAndView getReceiveNoteList(EmployeeVO employeeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//임시 id
		employeeVO.setId(20221231);

		List<NoteVO> ar = noteService.getReceiveNoteList(employeeVO);
		
		mv.addObject("list", ar);
		
		int id = 1;
		List<DepartmentVO> dl = messengerService.getDepList();
		List<EmployeeVO> el = messengerService.getEmpList();
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		mv.addObject("message", "all");
		
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



