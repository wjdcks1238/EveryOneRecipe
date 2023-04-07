package com.kh.everyrecipe.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
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
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.fileutil.FileUtil;
import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;
import com.kh.everyrecipe.postBookmark.service.PostBookmarkService;
import com.kh.everyrecipe.postLike.service.PostLikeService;



@Controller
@RequestMapping("/member")
public class MemberController {	
	
	@Autowired private MemberService mService;
	@Autowired private BoardService bService;
	@Autowired private FollowMappingService fService;
	@Autowired private PostLikeService plService;
	@Autowired private PostBookmarkService pbService;
	
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
	
	//내 정보 페이지
	@GetMapping("/myinfo")
	public ModelAndView myinfo(ModelAndView mv, Principal principal) throws Exception {
		
		//TODO
		//회원 정보 - 닉네임, 프로필, 프로필 사진, 팔로워 정보,  팔로잉 정보, (회원이고 본인이 아닐 시) 팔로우 버튼

		//회원 포스트 목록
		String id = principal.getName();
		Map<String, String> map = new HashMap<>();
		map.put("from", 0+"");
		map.put("to", 20+""); 
		map.put("myPage",id);
		mv.addObject("postList", bService.pagingList(map));
		
		mv.addObject("memberDto", mService.selectOne(id));
		mv.addObject("followingCount",fService.getFollowingCount(id));
		mv.addObject("followerCount",fService.getFollowerCount(id));

		
		//팔로워 수, 팔로잉 수 

		
		mv.setViewName("member/myinfo");
		return mv;
	}	
	//내 정보 업데이트
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
	
	
	//회원 정보
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
	
	
	
	
	//팔로잉 목록 페이지
	//다른 회원도 접근 가능
	@GetMapping("/following/{userId}")
	public ModelAndView following(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {

		
//		String id = principal.getName();
		mv.addObject("following",fService.getFollowing(userId));
		
		mv.setViewName("member/followMember");
		return mv;
	}
	//팔로워 목록 페이지
	@GetMapping("/follower/{userId}")
	public ModelAndView follower(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {
		
//		String id = principal.getName();
		mv.addObject("follower",fService.getFollower(userId));
		
		mv.setViewName("member/followMember");
		return mv;
	}
	
	
	//프로필 업데이트 페이지
	@GetMapping("/update")
	public ModelAndView profile(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", mService.selectOne(id));
		}
		mv.setViewName("member/update");
		return mv;
	}
	
	
	//프로필 사진 업데이트
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
	
	//프로필 사진 삭제
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
	//프로필 정보 업데이트
	@PostMapping("/update")
	public void updateProfile(
			Principal principal
			, MemberVo mvo
			) throws Exception {
		mvo.setUserId(principal.getName());
		//TODO 닉네임 중복 또는 비었을 때
		mService.update(mvo);
		
	}
	
	
	//좋아요 목록 페이지
	@GetMapping("/like")
	public ModelAndView likeList(ModelAndView mv, Principal principal)throws Exception {

		//좋아요 표시된 게시글 id 가져오기
		List<Integer> list= plService.getLikeList(principal.getName());
		//가져온 id들로 게시글 정보 가져오기
		if(!list.isEmpty()) {
			List<BoardVo> bList = plService.getLikePosts(list);
			mv.addObject("bList", bList);			
		}
		
		mv.setViewName("member/like");
		return mv;
	}
	
	//북마크 목록 페이지
	@GetMapping("/bookmark")
	public ModelAndView bookmarkList(ModelAndView mv, Principal principal)throws Exception {
		
		List<Integer> list= pbService.getBookmarkList(principal.getName());
		if(!list.isEmpty()) {
			List<BoardVo> bList = pbService.getBookmarkPosts(list);
			mv.addObject("bList", bList);
		}
		mv.setViewName("member/bookmark");
		return mv;
	}
	
}
