package com.app.home.messanger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("messanger")
public class MessangerController {

	@GetMapping("main")
	public void getMyMessanger()throws Exception{
		
	}
}
