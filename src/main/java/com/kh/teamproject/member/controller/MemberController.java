package com.kh.teamproject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.teamproject.member.service.MemberService;
import com.kh.teamproject.member.vo.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {	
	@Autowired 
	private MemberService service;
	
	@GetMapping("/signup")
	public String signup() {
		
		return "/signup";
	}
	
	@PostMapping("/signup")
	public ModelAndView signup(ModelAndView mv, MemberVo vo, RedirectAttributes rttr) throws Exception {
		int result = -1;
		
		result = service.insert(vo);
		
		if(result > 0) {
			rttr.addFlashAttribute("msg", "회원가입 성공");
		} else {
			rttr.addFlashAttribute("msg", "회원가입 실패");
		}
		return mv;
	}
}
