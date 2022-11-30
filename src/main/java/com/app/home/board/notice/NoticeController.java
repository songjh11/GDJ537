package com.app.home.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.board.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("notice")
@Slf4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("add")
	public String setNotice() {
		return "board/notice/add";
	}
	
	@PostMapping("add")
	public String setNotice(BoardVO boardVO) throws Exception{
		
		boolean chk = noticeService.checkValid(boardVO);
		
		if(chk) {
			//DB에 저장 진행
			int result = noticeService.setNotice(boardVO);
			
		}else {
			return "redirect:/notice/add?error=1";
		}
		return "redirect:/notice/detail?num="+boardVO.getNum();
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardVO boardVO, ModelAndView mv) throws Exception{
		boardVO = noticeService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/notice/detail");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardVO boardVO, ModelAndView mv)throws Exception{
		boardVO = noticeService.getDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/notice/update");
		return mv;
		
	}
	
	@PostMapping("update")
	public String setUpdate(BoardVO boardVO) throws Exception{
		log.info("update boardVO {}", boardVO);
		int result = noticeService.setUpdate(boardVO);
		
		return "redirect:/notice/detail?num="+boardVO.getNum();
	}
	
	@PostMapping("summerfile")
	@ResponseBody
	public String setSummerfile(MultipartFile files) throws Exception{
		log.info("써머 파일 {}", files);
		
		return "";
	}

}
