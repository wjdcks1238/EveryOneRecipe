package com.kh.everyrecipe.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {	
	
	@RequestMapping("/chat")
	public ModelAndView chatview(ModelAndView mv) {
		mv.setViewName("chat");
		return mv;
	}
}
