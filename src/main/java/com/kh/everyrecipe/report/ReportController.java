package com.kh.everyrecipe.report;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/report")
@Transactional
public class ReportController {
	
	@GetMapping("/post")
	public ModelAndView postReport(
			ModelAndView mv,
			@RequestParam("title") String title,
			@RequestParam("context") String context,
			@RequestParam("postId") int postId,
			Principal principal
			) {
		
		mv.addObject("foodName", title);
		mv.addObject("context", context);
		
		mv.setViewName("report/post_report");
		
		return mv;
	}
}
