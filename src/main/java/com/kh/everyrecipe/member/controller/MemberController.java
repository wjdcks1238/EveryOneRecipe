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
	
	//TODO
	@GetMapping("/myinfo")
	public ModelAndView myinfo(ModelAndView mv, Principal principal) throws Exception {
		
		//TODO
		//회원 정보 - 닉네임, 프로필, 프로필 사진, 팔로워 정보,  팔로잉 정보, (회원이고 본인이 아닐 시) 팔로우 버튼
		//
		//회원 포스트 목록
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", service.selectOne(id));
		}
		mv.setViewName("member/myinfo");
		return mv;
	}	
	@PostMapping("/myinfo")
	public ModelAndView insertMyinfo(
				MultipartHttpServletRequest multiReq
			  , @RequestParam(name="report", required = false) MultipartFile multi
			  , Principal principal
			  , ModelAndView mv
			  , MemberVo mvo
			) throws Exception {
		Map<String, String> uploadResult;
		
		if(multi!=null) {
			uploadResult = fileUtil.saveFile(multi);
//			System.out.println(uploadResult.get("original"));
//			System.out.println(uploadResult.get("url"));			
		}
		System.out.println(mvo);
		return mv;
	}
	
	@GetMapping("/update")
	public ModelAndView profile(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", service.selectOne(id));
		}
		mv.setViewName("member/update");
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView insertProfile(
				MultipartHttpServletRequest multiReq
			  , @RequestParam(name="report", required = false) MultipartFile multi
			  , Principal principal
			  , ModelAndView mv
			  , MemberVo mvo
			) throws Exception {
		Map<String, String> uploadResult;
		
		if(multi!=null) {
			uploadResult = fileUtil.saveFile(multi);
//			System.out.println(uploadResult.get("original"));
//			System.out.println(uploadResult.get("url"));			
		}
		System.out.println(mvo);

	//TODO 업데이트
		
		return mv;
	}
	
	
}
