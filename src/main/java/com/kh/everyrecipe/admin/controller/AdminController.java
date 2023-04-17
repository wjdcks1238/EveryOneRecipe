package com.kh.everyrecipe.admin.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired 
	private MemberService mService;
	@Autowired 
	private BoardService bService;
	
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
	
	//직원 관리 - 계정관리 페이지의 ADMIN권한을 가진 직원목록
	@GetMapping("/employee")
	public ModelAndView employee(ModelAndView mv, Principal principal) throws Exception {
		
		List<MemberVo> list = mService.selectAuth();
		
		List<MemberVo> list2 = mService.selectList();
		
		mv.addObject("memberDto", list);
		mv.addObject("selectList", list2);
		
		mv.setViewName("admin/employee");
		
		return mv;
	}
	//직원관리 상세페이지(window popup으로 열림)
	@GetMapping("/details/{userId}")
	public ModelAndView employee(@PathVariable String userId) throws Exception {
		MemberVo member = mService.selectOne(userId);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("memberDto", member); 
		
	    mv.setViewName("admin/details/admindetails");

	    return mv;
	}

	//직원 권한 부여 업데이트 (모달창)
	@PatchMapping(value = "/employee")
	public ResponseEntity<?> updateRole(@RequestBody Map<String, Object> updates, ModelAndView mv) throws Exception {
	    String userId = (String) updates.get("userId");
	    String role = (String) updates.get("role");
	    mService.updateAdmin(updates);
	    
	    mv.setViewName("redirect:/employee");
	    return ResponseEntity.ok("Role updated successfully");
	}

	
	
	//회원관리 페이지의 회원목록
	@GetMapping("/members")
	public ModelAndView members(ModelAndView mv, Principal principal) throws Exception {

		List<MemberVo> list = mService.selectList();
		
		mv.addObject("memberDto", list);
		
		mv.setViewName("admin/members");
		
		return mv;
	}
	//TODO: 작성한 게시글, 차단권한 , 탈퇴일, 게시글 신고 여부, 댓글 신고 여부
	//회원 관리 페이지 구성을 위해 post table 컬럼추가 와 BoardManagementDto 생성함
	@GetMapping("/memberstest")
	public ModelAndView postCounting(ModelAndView mv, Principal principal) throws Exception {

		mv.addObject("postingCount");
		mv.setViewName("admin/memberstest");
		
		return mv;
	}
	

	

	
	
}
