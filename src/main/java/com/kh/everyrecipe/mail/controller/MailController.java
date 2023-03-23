package com.kh.everyrecipe.mail.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired JavaMailSender mailSender;
		
	@GetMapping("/auth")
	public String sendAuth(@RequestBody (required = false) String email) {
		return "mail/auth";
	}
	
	@PostMapping(value="/auth", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String mailSendAuth(
			@RequestBody (required = false)
			String email
			) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper msgHelper = new MimeMessageHelper(message, true, "UTF-8");
			//헬퍼를 이용해서 email 연결 정보를 입력하는게 더 편리함
			//데이터의 양이 많다면 두번쨰 영역을 true를 하면된다 == multipart
			//마지막은 인코딩 형식 == utf-8
			
			msgHelper.setSubject("인증메일 제목");
			msgHelper.setText("인증번호");
			msgHelper.setTo(email);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "송신완료";
	}
}
