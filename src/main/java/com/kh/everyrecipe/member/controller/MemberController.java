package com.kh.everyrecipe.member.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.everyrecipe.fileutil.FileUtil;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {	
	@Autowired 
	private MemberService service;
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	

	
	
	//회원가입
	@PostMapping("/signup")
	public ModelAndView signup(ModelAndView mv, MemberVo vo, RedirectAttributes rttr) throws Exception {
		int result = service.insert(vo);
		
		if(result > 0) {
			rttr.addFlashAttribute("msg", "회원가입 성공");
			mv.setViewName("redirect:login");
		} else {
			rttr.addFlashAttribute("msg", "회원가입 실패");
			mv.setViewName("redirect:login");
		}
		return mv;
	}
	
	@GetMapping("/profile")
	public ModelAndView profile(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", service.selectOne(id));
		}
		mv.setViewName("member/profile");
		return mv;
	}
	
	@PostMapping("/profile")
	public ModelAndView insertProfile(
				MultipartHttpServletRequest multiReq
			  , @RequestParam(name="report", required = false) MultipartFile multi
			  , Principal principal
			  , ModelAndView mv
			) {
		Map<String, String> uploadResult;
		
		try {
			uploadResult = fileUtil.saveFile(multi);
			System.out.println(uploadResult.get("original"));
			System.out.println(uploadResult.get("url"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
}
