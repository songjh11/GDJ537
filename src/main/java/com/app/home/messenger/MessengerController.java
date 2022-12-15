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
	    userVO = userService.getMypage(userVO);
		Integer id = userVO.getId();
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<UserVO> el = messengerService.getEmpList();
		List<UserVO> pl = pickService.getPickList(id.toString());
		
		mv.addObject("user", userVO);
		
		// ------------------ 채팅목록 ------------------
		List<RoomVO> roomVOs = new ArrayList<>();
		RoomVO roomVO = new RoomVO();
		userVO.setId(userVO.getId());
		
		roomVOs = messengerService.getRoomList(roomVO);
		
		mv.addObject("roomList", roomVOs);
		mv.setViewName("messenger/chat");
		// ------------------ 채팅목록 ------------------
		
		mv.addObject("myId", id);
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		mv.addObject("url", "chat");
		mv.addObject("pickList", pl);
		return mv;
	}
	
	@PostMapping("searchEmp")
	public ModelAndView getSearchResult(HttpSession session, UserVO userVO, String kind, String keyword, String url) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
	    userVO = userService.getMypage(userVO);
		Integer id = userVO.getId();
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("kind", kind);
		List<UserVO> el = messengerService.getSearchResult(map);
		List<UserVO> pl = pickService.getPickList(id.toString());
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", userVO);
		mv.addObject("myId", id);
		mv.addObject("empList", el);
		mv.addObject("pickList", pl);
		mv.addObject("url", "chat");
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
	    userVO = userService.getMypage(userVO);
		Integer id = userVO.getId();
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", userVO);
		mv.addObject("url", "note");
		
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
		
		return mv;
	}
	
	//발신함
	@GetMapping("note/sent")
	@ResponseBody
	public ModelAndView getSendNoteList(HttpSession session, UserVO userVO, NotePager notePager)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
	    userVO = userService.getMypage(userVO);
		
		ModelAndView mv = new ModelAndView("jsonView");
		//임시 id
		userVO.setId(userVO.getId());
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
	    userVO = userService.getMypage(userVO);
		
		ModelAndView mv = new ModelAndView();
		noteVO = noteService.getNoteDetail(noteVO);
		
		
		UserVO sendUser = new UserVO();
		sendUser.setId(noteVO.getSendId().intValue());
		sendUser = userService.getMypage(sendUser);
		
		UserVO receiveUser = new UserVO();
		receiveUser.setId(noteVO.getReceiveId().intValue());
		receiveUser = userService.getMypage(receiveUser);
		
		mv.addObject("detail", noteVO);
		log.info("노트의 인포는 {}", noteVO);
		mv.addObject("sendUser", sendUser);
		mv.addObject("receiveUser", receiveUser);
		mv.addObject("session", userVO);
		
		userVO.setId(userVO.getId());
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
	    userVO = userService.getMypage(userVO);
		
		ModelAndView mv = new ModelAndView();
		userVO.setId(userVO.getId());
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
	
	@GetMapping("note/group")
	@ResponseBody
	public ModelAndView setGroup(HttpSession session, UserVO userVO, int[] arr)throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  = (UserVO)authentication.getPrincipal();
		Integer id = userVO.getId();
		
		ModelAndView mv = new ModelAndView("jsonView");
		log.info("인트배열을받으세염 {}",arr);
		
		
		
		
		userVO.setId(id);
		mv.addObject("member", userVO);
		mv.addObject("yourId", arr);
		
		return mv;
	}
	
	
	// --------------------- 유리 끝------------------------------
	
	// --------------------- 효경 ------------------------------
	
	// 채팅방 추가
	@PostMapping("addRoom")
	public ModelAndView setAddRoom(HttpSession session, UserVO userVO, RoomVO roomVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  = (UserVO)authentication.getPrincipal();
	    userVO = userService.getMypage(userVO);
	    
	    int [] id = roomVO.getId();
	    
	    for(int ids : id) {
	    	log.info("아이디에 뭐가있나? =====> {} ", id);
	    }
	    
	    // 로그인 회원을 방장으로
		roomVO.setHostId(userVO.getId());
//		UserVO userVO2 = new UserVO();
//		log.info("유저야아아 => {} ", userVO.getId());
//		// 방장도 유저이기 때문에 넣어줌
//		userVO2.setId(userVO.getId());
//		roomVO.setUserVO(userVO2);
		int result = messengerService.setAddRoom(roomVO);
		
		if(result > 0 ) {
			log.info("===========채팅방 생성 성공===========");
		}
		
		mv.setViewName("redirect:../messenger/chat");
		
		return mv;
	}
	
	// 채팅 인원
	@GetMapping("userCount")
	@ResponseBody
	public ModelAndView getUserCount()throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int userCount = messengerService.getUserCount();
		
		mv.addObject("userCount", userCount);
		mv.setViewName("messenger/chat");
		
		return mv;
	}
	
	
	// --------------------- 효경 끝 ------------------------------
	
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



