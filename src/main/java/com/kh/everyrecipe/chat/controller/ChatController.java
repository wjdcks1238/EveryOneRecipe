package com.kh.everyrecipe.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;


@Controller
public class ChatController {
	@Autowired
	private MemberService Service;
	
	@GetMapping("/chat")
	public ModelAndView chatGet(ModelAndView mv) throws Exception {
		//사용자 리스트 불러오기
		List<MemberVo> idlist = Service.selectList();
		mv.addObject("idlist", idlist);
		mv.setViewName("chat");
		return mv;
	}
	
}