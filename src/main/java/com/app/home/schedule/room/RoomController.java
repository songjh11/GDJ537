package com.app.home.schedule.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.goods.GoodsService;
import com.app.home.schedule.goods.GoodsVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/goods/*")
public class RoomController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/room/roomList")
	public ModelAndView getRoomList(GoodsVO goodsVO) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView();
		List<GoodsVO> goodsVOs = goodsService.getGoodsList(goodsVO);

		log.info("goodVO list: {}", goodsVOs);

		modelAndView.addObject("goodVO", goodsVOs);
		modelAndView.setViewName("/goods/room/roomList");

		return modelAndView;
	}

	@GetMapping("/room/roomDetail")
	public String getRoomDetail() throws Exception
	{
		return "/goods/room/roomDetail";
	}

	@GetMapping("/room/roomReserve")
	public String setRoomReserve() throws Exception
	{
		return "/goods/room/roomReserve";
	}
}
