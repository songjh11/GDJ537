package com.app.home.user.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.app.home.user.UserVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	@Autowired
	private JavaMailSender emailSender;
	
	public void sendPw(UserVO userVO) {
		SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("gogkgxgg@gmail.com");
        message.setTo(userVO.getEmail());
        message.setSubject("임시 비밀번호");
        message.setText(userVO.getPassword());
        emailSender.send(message);
	}
	
	
    public void sendSimpleMessage(MailVO mailVO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("gogkgxgg@gmail.com");
        message.setTo(mailVO.getAddress());
        message.setSubject(mailVO.getTitle());
        message.setText(mailVO.getContents());
        emailSender.send(message);
    }

}
