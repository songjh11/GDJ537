package com.app.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	@GetMapping("/index2")
	public String home2() {
		return "index2";
	}
	
	@GetMapping("/index3")
	public String home3() {
		return "index3";
	}

}
