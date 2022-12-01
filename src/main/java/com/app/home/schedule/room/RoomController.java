package com.app.home.schedule.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="/room/*")
@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("add")
	public String getAdd() throws Exception{
		return "/room/add";
	}
	
	@PostMapping("add")
	public String setAdd(RoomVO roomVO) throws Exception{
		int result = roomService.setAdd(roomVO);
		return "redirect:/";
	}

}
