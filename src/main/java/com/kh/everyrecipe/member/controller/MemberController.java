package com.kh.everyrecipe.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.fileutil.FileUtil;
import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.followMapping.vo.FollowVo;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberBlockVo;
import com.kh.everyrecipe.member.vo.MemberModifyDto;
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
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//csrf토큰 사용을 위해 추가
//	@Autowired
//	private CsrfTokenRepository csrfTokenRepository;

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
		System.out.println(passwordEncoder.encode(vo.getPassword()));
		if(StringUtils.hasText(vo.getPassword())) {
			String bCryptString=passwordEncoder.encode(vo.getPassword());
			vo.setPassword(bCryptString);
		}
		
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

	//아이디 중복체크
	@PostMapping("checkSignup")
	@ResponseBody
	public String signAjax(@RequestParam("userId") String userId) throws Exception {
		String str ="";
		int idcheck = mService.idcheck(userId); 
		if(idcheck > 0) {
			str = "n";
		}else {
			str = "y";
		}
		return str;
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
		map.put("othersPage",id);
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
		Map<String, String> map = new HashMap<>();
		map.put("from", 0+"");
		map.put("to", 20+"");
		map.put("userId", userId);
		
		
		mv.addObject("following",fService.getFollowing(map));
		mv.addObject("userId",userId);

		mv.setViewName("member/following");
		
		
		
		return mv;
	}
	
	@PostMapping("/followingIS")
	@ResponseBody
	public List<FollowVo> followingIS(int curPage, String userId) throws Exception{
		String from = (curPage-1)*20+"";
		String to = ((curPage-1)*20+20)+"";
		Map<String, String> map = new HashMap<>();
		map.put("from", from);
		map.put("to", to);
		map.put("userId", userId);
		List<FollowVo> list = fService.getFollowing(map);
		return list;
	}
	
	
	
	
	
	//팔로워 목록 페이지
	@GetMapping("/follower/{userId}")
	public ModelAndView follower(ModelAndView mv, Principal principal, @PathVariable String userId) throws Exception {
		
//		String id = principal.getName();
		Map<String, String> map = new HashMap<>();
		map.put("from", 0+"");
		map.put("to", 20+"");
		map.put("userId", userId);
		
		mv.addObject("follower",fService.getFollower(map));
		mv.addObject("userId",userId);
		
		mv.setViewName("member/follower");
		return mv;
	}
	@PostMapping("/followerIS")
	@ResponseBody
	public List<FollowVo> followerIS(int curPage, String userId) throws Exception{
		String from = (curPage-1)*20+"";
		String to = ((curPage-1)*20+20)+"";
		Map<String, String> map = new HashMap<>();
		map.put("from", from);
		map.put("to", to);
		map.put("userId", userId);
		List<FollowVo> list = fService.getFollower(map);
		return list;
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
	@GetMapping("/like/{pNum}")
	public ModelAndView likeList(ModelAndView mv, Principal principal,  @PathVariable int pNum)throws Exception {
		int limit=10; //한 페이지당 글 수
		//좋아요 표시된 게시글 id 가져오기
		List<Integer> list= plService.getLikeList(principal.getName(),pNum ,limit);
		//가져온 id들로 게시글 정보 가져오기
		if(!list.isEmpty()) {
			int totalCnt= plService.getLikeCountPaging(principal.getName());
			int totalPage = (totalCnt%limit==0) ?  (totalCnt/limit): (totalCnt/limit+1);
			
			int startPage =1;
			int endPage =5;
			if(pNum >5/2+1) {
				startPage =pNum-2;
				endPage =pNum+2;
			}
			if(endPage>=totalPage) {
				endPage=totalPage;
			}
			
			Map<String, Integer> map = new HashMap();

			map.put("totalPage", totalPage);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("currentPage", pNum);
			mv.addObject("pageInfo",map);
			
			List<BoardVo> bList = plService.getLikePosts(list);
			mv.addObject("bList", bList);			
		}
		
		mv.setViewName("member/like");
		return mv;
	}
	
	//북마크 목록 페이지
	@GetMapping("/bookmark/{pNum}")
	public ModelAndView bookmarkList(ModelAndView mv, Principal principal, @PathVariable int pNum)throws Exception {
		int limit=10; 
		List<Integer> list= pbService.getBookmarkList(principal.getName(),pNum ,limit);
		if(!list.isEmpty()) {
			int totalCnt= pbService.getBookmarkCount(principal.getName());
			int totalPage = (totalCnt%limit==0) ?  (totalCnt/limit): (totalCnt/limit+1);
			
			int startPage =1;
			int endPage =5;
			if(pNum >5/2+1) {
				startPage =pNum-2;
				endPage =pNum+2;
			}
			if(endPage>=totalPage) {
				endPage=totalPage;
			}
			Map<String, Integer> map = new HashMap();

			map.put("totalPage", totalPage);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("currentPage", pNum);
			mv.addObject("pageInfo",map);
			
			List<BoardVo> bList = pbService.getBookmarkPosts(list);
			mv.addObject("bList", bList);
		}

		
		mv.setViewName("member/bookmark");
		return mv;
		//TODO 북마크, 좋아요 페이징 처리 
	}
	
	//개인정보 수정 (/infoupdate) 1. 비밀번호 재확인 후 수정페이지로 넘어감
	//프로필 업데이트 페이지
	@GetMapping("/infoupdate")
	public ModelAndView infoupdate(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", mService.selectOne(id));
		}
		mv.setViewName("member/infoupdate");
		return mv;
	}
	//ajax로 비밀번호 인증
	@PostMapping("/infoupdateAjax")
	@ResponseBody
	public String infoupdateAjax(String password, Principal principal, HttpServletRequest request) throws Exception {
	    String str = "";
	    String id = principal.getName();

	    // 현재 로그인한 유저의 id로 member의 모든 정보 조
	    MemberVo m = mService.selectOne(id);
	    
	    //password는 사용자가 입력한 암호화 되기 전 비밀번호, m에 담긴 비밀번호는 암호화된 비밀번호 PasswordEncoder.matches 메소드는 
	    // 꼭!! 암호화 되기 전 비밀번호와 암호화 된 비밀번호를 파라미터로 넣어줘야 에러가 나지 않는다.
	    boolean isPasswordMatch = passwordEncoder.matches(password, m.getPassword());
	    
	    if (isPasswordMatch) {
	        str = "success";
	    } else {
	        str = "fail";
	    }
	    
	    return str;
	}

//	    // CSRF 토큰 검증
//        CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
//        if (csrfToken == null) {
//            str = "fail";
//            return str;
//        }
//        String csrfTokenValue = csrfToken.getToken();
//        String csrfHeaderName = csrfToken.getHeaderName();
        
//	    if(bCryptPasswordEncoder.matches(checkPassword, currPass)) {
//	    bCryptPasswordEncoder.encode(password)
	    
	//개인정보수정 : 비밀번호 변경 후 로그아웃 후 재로그인 해야함, 비밀번호 변경 없어도 됨, 비밀번호 변경시 유효성 체크
	@GetMapping("/modify")
	public ModelAndView modify(ModelAndView mv, Principal principal) throws Exception {
		String id = principal.getName();
		if(id != null) {
			mv.addObject("memberDto", mService.selectOne(id));
		}
		mv.setViewName("member/modify");
		return mv;
	}
	//개인정보수정
	@PostMapping("/modify")
	@ResponseBody
	public int modifyUser(String password, MemberModifyDto vo, Principal principal) 
	{
		int result = -1;
	    try {
	    	vo.setUserId(principal.getName());
	        result = mService.modify(vo);
	    } catch (Exception e) {
	    }
	    return result;// ajax success결과 페이지로 이동
	}
	
//    String str = "";
//    String id = principal.getName();
//
//    // 현재 로그인한 유저의 id로 member의 모든 정보 조
//    MemberVo m = mService.selectOne(id);
//    
//    //password는 사용자가 입력한 암호화 되기 전 비밀번호, m에 담긴 비밀번호는 암호화된 비밀번호 PasswordEncoder.matches 메소드는 
//    // 꼭!! 암호화 되기 전 비밀번호와 암호화 된 비밀번호를 파라미터로 넣어줘야 에러가 나지 않는다.
//    boolean isPasswordMatch = passwordEncoder.matches(password, m.getPassword());
//    
//    if (isPasswordMatch) {
//        str = "success";
//    } else {
//        str = "fail";
//    }
//    
//    return str;

	//이메일 중복체크
	@PostMapping("checkEmail")
	@ResponseBody
	public String modifyAjax(@RequestParam("email") String email) throws Exception {
		String str ="";
		int isEmailChecked = mService.checkEmail(email); 
		if(isEmailChecked > 0) {
			str = "n";
		}else {
			str = "y";
		}
		return str;
	}
	//회원탈퇴
	@GetMapping("/withdrawal")
	public int memberDelete(@RequestParam("userId") String userId, Principal principal, MemberModifyDto dto) throws Exception {
		dto.setUserId(principal.getName());
		int result = mService.memberDelete(userId);
		
		return result;
		
	}
	
	@GetMapping("/checkuserblocked")
	@ResponseBody
	public String ajaxCheckUserBlocked(
			Principal principal
			) throws Exception {
		String name = principal.getName();
		
		String isBlocked = mService.getBlockData(name);
		System.out.println(isBlocked);
		
		return isBlocked;
	}
	
	@GetMapping("/getuserblocked")
	@ResponseBody
	public String ajaxgetUserBlocked(
			Principal principal
			) throws Exception {
		String name = principal.getName();
		MemberBlockVo data = mService.getUserBlock(name);
		System.out.println(data);
		
		return new Gson().toJson(data);
	}

	
}
