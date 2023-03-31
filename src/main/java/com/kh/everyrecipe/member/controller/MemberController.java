package com.kh.everyrecipe.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.fileutil.FileUtil;
import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {	
	
	@Autowired 
	private MemberService mService;
	@Autowired
	private BoardService bService;
	@Autowired
	private FollowMappingService fService;
	
	private final String defaultProfileIMG ="/resources/tempProfileImg/defaultUser.svg" ;
	
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
		int result = mService.insert(vo);
		
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

		//회원 포스트 목록
		String id = principal.getName();
		Map<String, String> map = new HashMap<>();
		map.put("from", 0+"");
		map.put("to", 20+""); 
		map.put("userId",id);
		mv.addObject("postList", bService.pagingList(map));
		
		mv.addObject("memberDto", mService.selectOne(id));
		mv.addObject("followingCount",fService.getFollowingCount(id));
		mv.addObject("followerCount",fService.getFollowerCount(id));

		
		//팔로워 수, 팔로잉 수 

		
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
	
	
	@GetMapping("/info/{userId}")
	public ModelAndView info(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {

		//회원 포스트 목록
		String id = userId;
		Map<String, String> map = new HashMap<>();
		map.put("from", 0+"");
		map.put("to", 20+""); 
		map.put("userId",id);
		mv.addObject("postList", bService.pagingList(map));
		
		mv.addObject("memberDto", mService.selectOne(id));
		mv.addObject("followingCount",fService.getFollowingCount(id));
		mv.addObject("followerCount",fService.getFollowerCount(id));

		Map<String, String> map1 = new HashMap<String, String>();
		if(principal!=null) {
			map1.put("userId",userId); 
			map1.put("fwId",principal.getName()   ); 
			
			mv.addObject("isFollowed", fService.isFollowed(map1));
		}
		
		mv.setViewName("member/info");
		return mv;
	}
	
	
	
	
	
	//TODO 다른 회원도 접근 가능하게 변경
	@GetMapping("/following/{userId}")
	public ModelAndView following(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {

		
//		String id = principal.getName();
		mv.addObject("following",fService.getFollowing(userId));
		
		mv.setViewName("member/followMember");
		return mv;
	}
	@GetMapping("/follower/{userId}")
	public ModelAndView follower(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {
		
//		String id = principal.getName();
		mv.addObject("follower",fService.getFollower(userId));
		
		mv.setViewName("member/followMember");
		return mv;
	}
	
	
	
	@GetMapping("/update")
	public ModelAndView profile(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", mService.selectOne(id));
		}
		mv.setViewName("member/update");
		return mv;
	}
	
	@PostMapping("/updatepi")
	public ModelAndView updatePI(
				MultipartHttpServletRequest multiReq
			  , @RequestParam(name="report", required = false) MultipartFile multi
			  , Principal principal
			  , ModelAndView mv
			) throws Exception {
		Map<String, String> uploadResult;
		
		uploadResult = fileUtil.saveFile(multi);
		System.out.println(uploadResult.get("original"));	
		System.out.println(uploadResult.get("url"));			
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", principal.getName());
		map.put("profileUrl", uploadResult.get("url"));
		
		mService.updatePI(map);

		mv.setViewName("redirect:/member/update");
		
		return mv;
	}
	
	
	@PostMapping("/deletepi")
	public void deletePI(
			Principal principal
			, MemberVo mvo
			, HttpServletRequest request

			) throws Exception {
		mvo.setUserId(principal.getName());
		//TODO 닉네임 중복 또는 비었을 때
		
		
		mvo.setProfileUrl(request.getContextPath()+defaultProfileIMG);
		System.out.println(mvo);
		mService.deletePI(mvo);

	
	}
	@PostMapping("/update")
	public void updateProfile(
			Principal principal
			, MemberVo mvo
			) throws Exception {
		mvo.setUserId(principal.getName());
		//TODO 닉네임 중복 또는 비었을 때
		mService.update(mvo);
		
	}
	
	
}
