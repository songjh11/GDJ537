package com.app.home.schedule.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.goods.GoodsService;
import com.app.home.schedule.goods.GoodsVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/goods/*")
public class RoomController
{
	@Autowired
	private RoomService roomService;

	@GetMapping("/room/roomList")
	public ModelAndView getRoomList(GoodsVO goodsVO) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView();
		List<GoodsVO> goodsVOs = roomService.getRoomList(goodsVO);

		log.info("goodVO list: {}", goodsVOs);

		modelAndView.addObject("goodVO", goodsVOs);
		modelAndView.setViewName("/goods/room/roomList");

		return modelAndView;
	}

	@GetMapping("/room/roomDetail")
	public ModelAndView getRoomDetail(GoodsVO goodsVO) throws Exception
	{
		log.info("======= roomDetail =======");
		ModelAndView modelAndView = new ModelAndView();
		goodsVO = roomService.getRoomTotal(goodsVO);

		// log.info("goodVO 1 : {}", goodsVO);

		modelAndView.addObject("goodDetail", goodsVO);
		modelAndView.setViewName("/goods/room/roomDetail");

		return modelAndView;
	}

	@GetMapping("/room/roomReserve")
	public ModelAndView setRoomReserve(GoodsVO goodsVO, RoomVO roomVO) throws Exception
	{
		log.info("======= get roomReserve =======");
		ModelAndView modelAndView = new ModelAndView();
		goodsVO = roomService.getRoomTotal(goodsVO);
		List<RoomVO> roomVOs = roomService.getReserveStartTime(roomVO);
		log.info("roomVOs: {}", roomVOs);

		// log.info("goodVO 1 : {}", goodsVO);

		modelAndView.addObject("stTime", roomVOs);
		modelAndView.addObject("goodDetail", goodsVO);
		modelAndView.setViewName("/goods/room/roomReserve");

		return modelAndView;
	}

	@PostMapping("/room/roomReserve")
	public ModelAndView setRoomReserve(RoomVO roomVO) throws Exception
	{
		log.info("======= post roomReserve =======");
		ModelAndView modelAndView = new ModelAndView();
		int rs = roomService.setRoomReserve(roomVO);

		log.info("room reserve: {}", rs);

		// modelAndView.setViewName("/goods/room/roomReserve");
		modelAndView.setViewName("/goods/room/roomList");

		return modelAndView;
	}

	@GetMapping("/room/roomResInfo")
	public ModelAndView getRoomResInfo(RoomVO roomVO) throws Exception
	{
		log.info("====== get Info =====");
		ModelAndView modelAndView = new ModelAndView();
		List<RoomVO> roomVOs = roomService.getResInfo(roomVO);

		log.info("roomVOs: {}", roomVOs);

		modelAndView.addObject("roomInfo", roomVOs);
		modelAndView.setViewName("/goods/room/roomResInfo");

		return modelAndView;
	}
}
