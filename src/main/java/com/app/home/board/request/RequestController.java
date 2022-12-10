package com.app.home.board.request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.board.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("request")
@Slf4j
public class RequestController {
	
	@Autowired
	private RequestService requestService;
	
	@GetMapping("add")
	public String setRequest() {
		return "board/request/add";
	}
	
	@PostMapping("add")
	public String setRequest(BoardVO boardVO) throws Exception{
		
		boolean chk = requestService.checkValid(boardVO);
		
		if(chk) {
			//DB에 저장 진행
			int result = requestService.setRequest(boardVO);
			
		}else {
			return "redirect:/request/add?error=1";
		}
		return "redirect:/request/detail?num="+boardVO.getNum();
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardVO boardVO, ModelAndView mv) throws Exception{
		boardVO = requestService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/request/detail");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardVO boardVO, ModelAndView mv)throws Exception{
		boardVO = requestService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/request/update");
		return mv;
		
	}
	
	@PostMapping("update")
	public String setUpdate(BoardVO boardVO) throws Exception{
		log.info("update boardVO {}", boardVO);
		int result = requestService.setUpdate(boardVO);
		
		return "redirect:/request/detail?num="+boardVO.getNum();
	}

}
