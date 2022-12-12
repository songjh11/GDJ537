package com.app.home.board.unknown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.board.BoardVO;
import com.app.home.util.Pager;

@Controller
@RequestMapping("/unknown/*")
public class UnknownController {

	@Autowired
	private UnknownService unknownService;

	@PostMapping("delete")
	@ResponseBody
	public int setUnknownDelete(BoardVO boardVO) throws Exception {
		return unknownService.setUnknownDelete(boardVO);
	}

	@PostMapping("update")
	public String setUnknownUpdate(BoardVO boardVO) throws Exception{
		int result = unknownService.setUnknownUpdate(boardVO);

		return "redirect:/unknown/detail?num="+boardVO.getNum();
	}

	@GetMapping("update")
	public ModelAndView setUnknownUpdate(BoardVO boardVO, ModelAndView mv)throws Exception{
		boardVO = unknownService.getUnknownDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("/board/unknown/update");
		return mv;

	}

	@GetMapping("detail")
	public ModelAndView getUnknownDetail(BoardVO boardVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardVO = unknownService.getUnknownDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("board/unknown/detail");

		return mv;
	}

	@PostMapping("add")
	public String setUnknownAdd(BoardVO boardVO) throws Exception {

		int result = unknownService.setUnknownAdd(boardVO);

		return "redirect:/unknown/list";
	}

	@GetMapping("add")
	public String getUnknownAdd() throws Exception {
		return "board/unknown/add";
	}

	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv, Pager pager) throws Exception{

		pager.setSort(3);
		mv.addObject("unknownList", unknownService.getUnknownList(pager));
		mv.addObject("pager", pager);
		mv.setViewName("/board/unknown/list");

		return mv;
	}

	@GetMapping("hit")
	public ModelAndView setHit(BoardVO boardVO) throws Exception {
		int result = unknownService.setHit(boardVO);

		ModelAndView mv = new ModelAndView();
		boardVO = unknownService.getUnknownDetail(boardVO);
		mv.addObject("boardVO", boardVO);
		mv.setViewName("board/unknown/detail");

		return mv;
	}

}
