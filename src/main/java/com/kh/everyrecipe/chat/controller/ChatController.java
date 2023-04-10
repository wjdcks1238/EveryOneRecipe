package com.kh.everyrecipe.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@GetMapping("/chat")
	public String chatGet() {
		logger.info("@ChatController, chatGet()");
		
		return "chat";
	}
	
}
