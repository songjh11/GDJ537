package com.app.home.schedule.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/room/*")
public class RoomController
{
	@Autowired
	public RoomService roomService;

	@GetMapping("roomList")
	public ModelAndView roomList(RoomVO roomVO) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView();
		List<RoomVO> roomVOs = roomService.getRoomList(roomVO);

		log.info("roomVO list: {}", roomVOs);

		modelAndView.addObject("room", roomVOs);
		modelAndView.setViewName("/room/roomList");

		return modelAndView;
	}

	@GetMapping("roomReserve")
	public String roomReserve() throws Exception
	{
		return "/room/roomReserve";
	}
}
