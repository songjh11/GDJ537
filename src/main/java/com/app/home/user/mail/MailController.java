package com.app.home.user.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mail/*")
@Slf4j
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("mail")
	public String sendMail(MailVO mailVO) {
		mailService.sendSimpleMessage(mailVO);
		return "redirect:../";
	}

}
