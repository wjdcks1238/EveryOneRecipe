package com.kh.everyrecipe.weekboard.controller;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.weekboard.service.weekService;
import com.kh.everyrecipe.weekboard.vo.weekVo;

@Controller
public class weekController {
	@Autowired
	private weekService service;
	
	@RequestMapping(value = "/weekboard", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv ) {		
		List<weekVo> weeklist = service.weekList();
		mv.addObject("weekboard", weeklist);
		mv.setViewName("weekboard");
		
		return mv;
	}
	
}
