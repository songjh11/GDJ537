package com.app.home.user.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	@Autowired
	private JavaMailSender emailSender;
	 
    public void sendSimpleMessage(MailVO mailVO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("gogkgxgg@gmail.com");
        message.setTo(mailVO.getAddress());
        message.setSubject(mailVO.getTitle());
        message.setText(mailVO.getContents());
        emailSender.send(message);
    }

}
