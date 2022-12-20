package com.app.home.board.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.board.BoardVO;
import com.app.home.user.UserVO;
import com.app.home.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/request/*")
@Slf4j
public class RequestController {
	
	@Autowired
	private RequestService requestService;
	
	@GetMapping("add")
	public String setRequest() {
		return "board/request/add";
	}
	
	@PostMapping("add")
	public String setRequest(@AuthenticationPrincipal UserVO userVO, BoardVO boardVO) throws Exception{
		;
		boardVO.setCreator(userVO.getId());
		
		boolean chk = requestService.checkValid(boardVO);
		
		if(chk) {
			//DB에 저장 진행
			int result = requestService.setRequest(boardVO);
			
		}else {
			return "redirect:/request/add?error=1";
		}
		return "redirect:/request/detail?id="+boardVO.getId();
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardVO boardVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardVO = requestService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("board/request/detail");

		return mv;
	}
	
	@PostMapping("delete")
	@ResponseBody
	public int setDelete(BoardVO boardVO) throws Exception {
		return requestService.setRequestDelete(boardVO);
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardVO boardVO, ModelAndView mv)throws Exception{
		
		boardVO = requestService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/request/update");
		return mv;
		
	}
	
	@PostMapping("update")
	public String setUpdate(@AuthenticationPrincipal UserVO userVO, BoardVO boardVO) throws Exception{
		boardVO.setCreator(userVO.getId());
		log.info("update boardVO {}", boardVO);
		int result = requestService.setUpdate(boardVO);
		
		return "redirect:/request/detail?id="+boardVO.getId();
	}

	@GetMapping("list")
	public ModelAndView getList(@AuthenticationPrincipal UserVO userVO, ModelAndView mv, Pager pager) throws Exception{
		log.info("요청게시판 {}", userVO.getDepartmentVO().getDepNum());
		pager.setDepNum(userVO.getDepartmentVO().getDepNum());
		pager.setSort("요청");
		mv.addObject("requestList", requestService.getList(pager));
		mv.addObject("pager", pager);
		mv.setViewName("/board/request/list");
		System.out.println("AFTER : "+pager.getOrder());
		return mv;
	}
	
	@GetMapping("getListByRequestAjax")
	public ModelAndView getListByRequestAjax(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("requestList", requestService.getListByRequestAjax(pager));
		mv.addObject("pager", pager);
		mv.setViewName("board/request/requestResult");
		System.out.println("AFTER : "+pager.getOrder());
		return mv;
	}
	
	@GetMapping("hit")
	public ModelAndView setHit(BoardVO boardVO) throws Exception {
		int result = requestService.setHit(boardVO);
		
		ModelAndView mv = new ModelAndView();
		boardVO = requestService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("board/request/detail");
		
		return mv;
	}
	@PostMapping("reqcate")
	@ResponseBody
	public List<ReqCategoryVO> findReqCategory(ReqCategoryVO reqCategoryVO)throws Exception{
		
		List<ReqCategoryVO> al = requestService.findReqCategory(reqCategoryVO);
		
		return al;
	}
}
