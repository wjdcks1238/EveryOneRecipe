package com.kh.everyrecipe.boardsearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/search")
public class BoardSearchController {
	
	@GetMapping("/result")
	public ModelAndView SearchResult(
				ModelAndView mv,
				@RequestParam String keyword
			) {
		mv.addObject(keyword);
		mv.setViewName("search/result");
		return mv;
	}
}
