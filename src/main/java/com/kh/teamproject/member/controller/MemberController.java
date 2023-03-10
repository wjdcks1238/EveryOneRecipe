package com.kh.teamproject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamproject.member.service.MemberService;
import com.kh.teamproject.member.vo.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {	
	@Autowired 
	private MemberService service;
	
	@GetMapping("/signUp")
	public ModelAndView viewInsert(ModelAndView mv) {
		
		mv.setViewName("member/signUp");
		return mv;
		
	}
	
	//@PostMapping("/signUp")
	@GetMapping("/testSignUp")
	public ModelAndView insert(ModelAndView mv, MemberVo vo) throws Exception {
		vo.setUserId("user2");
		vo.setUserName("사용자2");
		vo.setUserNickName("이용자2");
		vo.setPassword("user2");
		vo.setEmail("user2@example.com");
		vo.setAddress("경기도 시흥시 정왕동");
		int result = -1;
		
		result = service.insert(vo);
		
		if(result == 1) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		
		return mv;
	}
}
