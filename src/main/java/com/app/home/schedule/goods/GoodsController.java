package com.app.home.schedule.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="/goods/*")
@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("add")
	public String getAdd() throws Exception{
		return "/goods/add";
	}
	
	@PostMapping("add")
	public String setAdd(GoodsVO goodsVO) throws Exception{
		int result = goodsService.setAdd(goodsVO);
		return "redirect:/goods/add";
	}
	
	@GetMapping("update")
	public String getUpdate() throws Exception{
		return "/goods/update";
	}

}
