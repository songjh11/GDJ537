package com.app.home.schedule.goods;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@RequestMapping(value = "/goods/*")
@Controller
@Slf4j
public class GoodsController
{

	@Autowired
	private GoodsService goodsService;

	@GetMapping("add")
	public String getAdd() throws Exception
	{
		return "/goods/add";
	}

	@PostMapping("add")
	public String setAdd(GoodsVO goodsVO, MultipartFile[] files, RedirectAttributes redirectAttributes, HttpSession session)
			throws Exception
	{
		int result = goodsService.setAdd(goodsVO, files, session.getServletContext());
		return "redirect:/goods/add";
	}

	@GetMapping("update")
	public ModelAndView getUpdate(GoodsVO goodsVO, ModelAndView mv, HttpSession session) throws Exception
	{
		goodsVO = goodsService.getGoods(goodsVO);
		String str = goodsVO.getId().substring(0, 2);
		session.setAttribute("id", goodsVO.getId());
		System.out.println(goodsVO.getGoodsFileVO());
		List<GoodsFileVO> list = goodsVO.getGoodsFileVO();
		mv.addObject("list", list);
		mv.addObject("str", str);
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/update");
		return mv;
	}

	@PostMapping("update")
	public String setUpdate(GoodsVO goodsVO, HttpSession session) throws Exception
	{
		String id = (String) session.getAttribute("id");
		goodsVO.setId(id);
		int result = goodsService.setUpdate(goodsVO);
		return "/goods/update";

	}

}
