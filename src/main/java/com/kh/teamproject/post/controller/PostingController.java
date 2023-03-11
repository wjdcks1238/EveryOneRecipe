package com.kh.teamproject.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostingController {

	@GetMapping("posting")
	public String postingPage() {
		
		return "post/posting";
	}
	@PostMapping("posting")
	public ModelAndView post(ModelAndView mv, String text, String ing, String amt) {
		System.out.println(text);
		System.out.println(ing);
		System.out.println(amt);
		mv.setViewName("post/posting");
		return mv;
	}
}
