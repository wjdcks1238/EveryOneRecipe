package com.kh.everyrecipe.mail.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mail")
public class MailSenderController {
	@Autowired JavaMailSender mailSender;//위에서 만든 이메일 송신용 config 클래스 선언  
	@Autowired private JavaMailSenderImpl javaMailSender;
	
	@GetMapping("/auth")
	public String mailAuth() {
		return "mail/auth";
	}

    @ResponseBody
	@PostMapping(value = "/auth", produces = "text/html; charset=UTF-8") 
    public String sendAuth(@RequestBody (required = false)String email) { 
    //﻿(required = false) 매개변수의 null의 여부를 지정 -> false ==  null일 수도 있다.
    	MimeMessage message = javaMailSender.createMimeMessage();
    	
        try {
			MimeMessageHelper msgHelper = new MimeMessageHelper(message, true, "UTF-8");
			//헬퍼를 이용해서 email 연결 정보를 입력하는게 더 편리함
			//데이터의 양이 많다면 두번쨰 영역을 true를 하면된다 == multipart
			//마지막은 인코딩 형식 == utf-8
			
			msgHelper.setSubject("인증메일제목"); //이메일의 제목
			msgHelper.setText("인증번호"); //이메일의 내용
			msgHelper.setTo(email); //jsp에서 받은 수신자 이메일 번호
			
			 
			mailSender.send(message);//메일을 송부
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return "송신 완료"; //이상 없을 시 문자열 jsp에 리턴
     }


}
