package com.app.home.messenger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.user.DepartmentVO;
import com.app.home.user.UserService;
import com.app.home.user.UserVO;

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
	
	@Autowired
	private UserService userService;
	
	@GetMapping("chat")
	public ModelAndView getMyChat(HttpSession session, UserVO userVO)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  = (UserVO)authentication.getPrincipal();
	    log.info("uv:{}", userVO);
	    userVO = userService.getMypage(userVO);
		Integer id = userVO.getId();
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<UserVO> el = messengerService.getEmpList();
		List<UserVO> pl = pickService.getPickList(id.toString());
		
		mv.addObject("user", userVO);
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		mv.addObject("pickList", pl);
		mv.addObject("message", "all");
		return mv;
	}
	
	@PostMapping("searchEmp")
	public ModelAndView getSearchResult(HttpSession session, UserVO userVO, String kind, String keyword) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
	    userVO = userService.getMypage(userVO);
		Integer id = userVO.getId();
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("kind", kind);
		List<UserVO> el = messengerService.getSearchResult(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", userVO);
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
		return result;
	}
	
	// --------------------- 유리 ------------------------------
	
	//수신함
	@GetMapping("note")
	public ModelAndView getReceiveNoteList(HttpSession session, UserVO userVO, NotePager notePager)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
		Integer id = userVO.getId();
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", userVO);
		
		//임시 id
		userVO.setId(id);

		List<NoteVO> ar = noteService.getReceiveNoteList(userVO, notePager);
		
		Long getNotReadCount = noteService.getNotReadCount(userVO);
		mv.addObject("list", ar);
		mv.addObject("pager", notePager);
		if(getNotReadCount==0L) {
			mv.addObject("getNotReadCount", "");
		} else {
			mv.addObject("getNotReadCount", getNotReadCount);
		}
		
		
		if(ar.size()==0) {
			log.info("=============================비었따");
			mv.addObject("message5", "쪽지가 없습니다.");
		} else {
			mv.addObject("message5", "");
		}
		
		
		
		List<DepartmentVO> dl = messengerService.getDepList();
		List<UserVO> el = messengerService.getEmpList();
		List<UserVO> pl = pickService.getPickList(id.toString());
		
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		mv.addObject("pickList", pl);
		mv.addObject("message", "all");
		
		return mv;
	}
	
	//발신함
	@GetMapping("note/sent")
	@ResponseBody
	public ModelAndView getSendNoteList(HttpSession session, UserVO userVO, NotePager notePager)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
		Integer id = userVO.getId();
		
		ModelAndView mv = new ModelAndView("jsonView");
		//임시 id
		userVO.setId(id);
		List<NoteVO> ar = noteService.getSendNoteList(userVO, notePager);
		mv.addObject("list", ar);
		mv.addObject("pager", notePager);
		
		if(ar.size()==0) {
			log.info("=============================발신비었따");
			mv.addObject("message5", "쪽지가 없습니다.");
		} else {
			mv.addObject("message5", "");
		}
		return mv;
	}
	
	//쪽지 상세
	@GetMapping("note/detail")
	public ModelAndView getNoteDetail(HttpSession session, NoteVO noteVO, UserVO userVO)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
		Integer id = userVO.getId();
		
		ModelAndView mv = new ModelAndView();
		noteVO = noteService.getNoteDetail(noteVO);
		mv.addObject("detail", noteVO);
		
		userVO.setId(id);
		Long reid = new Long(userVO.getId());
		
		noteVO.setReceiveId(reid);
		if(noteVO.getReadCheck()==1) {
			int result = noteService.updateCheck(noteVO);
		} else {
			
		}
		
		mv.setViewName("messenger/note/detail");
		return mv;
	}
	
	//쪽지발송
	@GetMapping("note/send")
	public ModelAndView setSendNote(HttpSession session, UserVO userVO)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
		Integer id = userVO.getId();
		
		ModelAndView mv = new ModelAndView();
		userVO.setId(id);
		mv.addObject("member", userVO);
		return mv;
	}
	
	@PostMapping("note/send")
	public ModelAndView setSendNote(HttpSession session, NoteVO noteVO)throws Exception{
		
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
	
//	@GetMapping("note/check")
//	@ResponseBody
//	public int updateCheck(NoteVO noteVO)throws Exception{
//		return noteService.updateCheck(noteVO);
//	}
	
	@GetMapping("note/delete")
	@ResponseBody
	public int setDeleteNote(NoteVO noteVO)throws Exception{
		return noteService.setDeleteNote(noteVO);
	}
	
	
	// --------------------- 유리 끝------------------------------
	
	// --------------------- 효경 ------------------------------
	
	
	// 채팅방 목록
	@GetMapping("addRoom")
	public String setAddRoom()throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<RoomVO> roomVOs = new ArrayList<>();
		
		roomVOs = messengerService.getRoomList();
		
		mv.addObject("roomList", roomVOs);
		mv.setViewName("messenger/room/addRoom");
		
		return "messenger/room/addRoom";
	}
	
	// 채팅방 추가
	@PostMapping("addRoom")
	public ModelAndView setAddRoom(HttpSession session, RoomVO roomVO)throws Exception{
		
		//임시 ID
		roomVO.setHostId(5678);
		ModelAndView mv = new ModelAndView();
		
		for(Integer id : roomVO.getId()) {
			UserVO userVO = new UserVO();
			userVO.setId(id);
		}
		
		int result = messengerService.setAddRoom(roomVO);
		
		
		mv.setViewName("messenger/chat");
		
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
	
		mv.setViewName("redirect:../messenger/chat");
		return mv;
	}

	
}



