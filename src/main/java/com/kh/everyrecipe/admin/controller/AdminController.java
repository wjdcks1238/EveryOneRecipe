package com.kh.everyrecipe.admin.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.member.dao.MemberDao;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired 
	private MemberService mService;
	
	@GetMapping("")
	public String admin() {
		return "admin/admin";
	}
	
	
	//검색어 관리 페이지
	@GetMapping("/search/searchword")
	public ModelAndView searchword(ModelAndView mv) throws Exception {
		
		//TODO
		
		return mv;
	}
	
	//검색어순위 관리 페이지
	@GetMapping("/search/searchrank")
	public ModelAndView searchrank(ModelAndView mv) throws Exception {

		//TODO
		return mv;
	}
	
	//직원 관리 페이지
	@GetMapping("/employee")
	public ModelAndView employee(ModelAndView mv, Principal principal) throws Exception {

		List<MemberVo> list = mService.selectAuth();
		
		mv.addObject("memberDto", list);
		
		mv.setViewName("admin/employee");
		
		return mv;
	}
	//직원 권한 부여 업데이트
	@PostMapping("/employee")
	public void updateAuth(MemberVo vo) throws Exception {
		
		vo.getAuthority();
		mService.updateAdmin(vo);
		
		
	}
	
	
	//회원 관리 페이지
	@GetMapping("/members")
	public ModelAndView members(ModelAndView mv, Principal principal) throws Exception {

		List<MemberVo> list = mService.selectList();
		
		mv.addObject("memberDto", list);
		
		mv.setViewName("admin/members");
		
		return mv;
	}
	
	//관리페이지
	@GetMapping("/details/{userId}")
	public ModelAndView employee(@PathVariable String userId) throws Exception {
		MemberVo member = mService.selectOne(userId);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("memberDto", member); 
		
	    mv.setViewName("admin/details/admindetails");

	    return mv;
	}
	

	
}
