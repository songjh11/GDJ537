package com.app.home.messenger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("messenger")
public class MessengerController {

	@GetMapping("chat")
	public void getMyChat()throws Exception{
		
	}
	
	@GetMapping("msg")
	public void getMyMessenger()throws Exception{
		
	}



















}



