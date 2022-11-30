package com.app.home.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void getDetail(BoardVO boardVO) throws Exception{
		boardVO = noticeService.getDetail(boardVO);
		log.info("board {}",boardVO);
	}

}
