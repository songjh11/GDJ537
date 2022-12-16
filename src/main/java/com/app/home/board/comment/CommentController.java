package com.app.home.board.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@GetMapping("add")
	public String getCommentAdd() throws Exception {
		return "board/comment/add";
	}

	@PostMapping("add")
	@ResponseBody
	public String setCommentAdd(CommentVO commentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = commentService.setCommentAdd(commentVO);
		String jsonResult="{\"result\":\""+result+"\"}";
		return jsonResult;
	}

	@GetMapping("update")
	public ModelAndView setCommentUpdate(CommentVO commentVO, ModelAndView mv) throws Exception {
		commentVO = commentService.getCommentDetail(commentVO);
		mv.addObject("commentVO", commentVO);
		mv.setViewName("/board/comment/update");
		return mv;
	}

	@PostMapping("update")
	@ResponseBody
	public int setCommentUpdate(CommentVO commentVO) throws Exception {
		int result = commentService.setCommentUpdate(commentVO);
		//return "redirect:/comment/detail?num="+commentVO.getnum();
		return result;
	}

	@GetMapping("list")
	@ResponseBody
	public Map<String, Object> getCommentList(CommentPager commentPager) throws Exception {
		Map<String, Object> map = new HashMap<>();
		List<CommentVO> list = commentService.getCommentList(commentPager);

		map.put("list", list);
		map.put("pager", commentPager);

		return map;
	}


	//		//수정
	//		@PostMapping("commentUpdate")
	//		public int setCommentUpdate(CommentVO commentVO)throws Exception {
	//			int result = commentService.setCommentUpdate(commentVO);
	//			return result;
	//		}
	//삭제
	@PostMapping("delete")
	@ResponseBody
	public int setCommentDelete(CommentVO commentVO)throws Exception {
		int result = commentService.setCommentDelete(commentVO);
		return result;
	}


}
