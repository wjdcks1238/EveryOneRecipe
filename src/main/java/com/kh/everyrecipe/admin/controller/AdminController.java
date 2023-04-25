package com.kh.everyrecipe.admin.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.boardsearch.service.BoardSearchService;
import com.kh.everyrecipe.boardsearch.vo.SearchVo;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;
import com.kh.everyrecipe.report.service.ReportService;
import com.kh.everyrecipe.report.vo.BlockedMemberVo;
import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCmtVoAll;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;
import com.kh.everyrecipe.report.vo.ReportedPostVoAll;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired 
	private MemberService mService;
	@Autowired 
	private BoardService bService;
	@Autowired
	private BoardSearchService bsService;
	@Autowired
	private ReportService rService;
	
	@GetMapping("")
	public String admin() {
		return "admin/admin";
	}
	
	
	//검색어 관리 페이지
	@GetMapping("/search/searchword")
	public ModelAndView searchword(ModelAndView mv) throws Exception {
		
		List<SearchVo> list = bsService.operatorSearchList();
		mv.addObject("searchList", list);
		
		return mv;
	}
	
	@GetMapping("/search/searchword/visibledata")
	@ResponseBody
	public String refreshSeachData(
			@RequestParam("keword") String keyword
			) throws Exception {
		//json으로 변환 할 데이터를 받는 변수
		List<SearchVo> list = null;
		//update문 작동 시, 받아올 반환 변수
		int swresult;
		//검색어 숨김 여부를 가져옴
		String isVisible = bsService.getkeywordVisible(keyword);
		System.out.println(isVisible);
		
		if(isVisible.equals("N")) {
			//검색어 제외 항목을 'Y'로 변경(검색어 순위에 표출이 안됨.)
			swresult = bsService.swipeVisibleY(keyword);
			if(swresult == 1) {
				list = bsService.operatorSearchList();
			} else {
				
			}
		} else if(isVisible.equals("Y")) {
			//검색어 제외 항목을 'N'로 변경(검색어 순위에 표출.)
			swresult = bsService.swipeVisibleN(keyword);
			if(swresult == 1) {
				list = bsService.operatorSearchList();
			} else {
				
			}
		}
		return new Gson().toJson(list);
	}
	
	//검색어순위 관리 페이지
	@GetMapping("/search/searchrank")
	public ModelAndView searchrank(ModelAndView mv) throws Exception {

		List<SearchVo> list = bsService.rankSearchList();
		
		mv.addObject("searchRank", list);
		return mv;
	}
	
	//검색추이 페이지
	@GetMapping("/search/searchprogress")
	public ModelAndView searchProgress(ModelAndView mv) throws Exception{
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
	

	

	
	//post id 기준으로 정렬/게시글 번호/ 작성자 정보/신고 횟수
	@GetMapping("/reported-posts")
	public ModelAndView pManage(ModelAndView mv, Principal principal) throws Exception {

		//mv.addObject("postingCount");
		
		List<ReportedPostVo> reportList= rService.getReportedPosts();
		
		mv.addObject("reportList",reportList);
		
		mv.setViewName("admin/reported-posts");
		
		return mv;
	}
	
	
	@PostMapping("/modal-p")
	@ResponseBody
	public List<ReportVo> modalP(String postId){
		//postid를 받아서 신고 정보를 넘겨준다.
		
		List<ReportVo> reportList = rService.getReportInfoP(postId);
		
		return reportList;
	}
	
	//분류하지 않은 전체 목록 보기
	@PostMapping("/all-reported-p")
	@ResponseBody
	public List<ReportedPostVoAll> pGetAllReported(){
		
		List<ReportedPostVoAll> reportList = rService.getAllReportedP();
	//신고 번호, 게시글 번호, 게시글 이름,	게시글 작성자 id, 신고자 id, 신고 내용, 신고 시각 
		return reportList;
	}
	
	
	
	
	//cmtId 기준으로 정렬/게시글 번호/ 작성자 정보/신고 횟수
	@GetMapping("/reported-comments")
	public ModelAndView cManage(ModelAndView mv, Principal principal) throws Exception {
		
		List<ReportedCommentVo> reportList= rService.getReportedComments();
		
		mv.addObject("reportList",reportList);
		
		mv.setViewName("admin/reported-comments");
		
		return mv;
	}
	
	
	@PostMapping("/modal-c")
	@ResponseBody
	public List<ReportVo> modalC(String cmtId){
		//cmtId를 받아서 신고 정보를 넘겨준다.
		
		List<ReportVo> reportList = rService.getReportInfoC(cmtId);
		
		return reportList;
	}
	//분류하지 않은 전체 목록 보기
	@PostMapping("/all-reported-c")
	@ResponseBody
	public List<ReportedCmtVoAll> cGetAllReported(){
		
		List<ReportedCmtVoAll> reportList = rService.getAllReportedC();
	//신고 번호, 댓글 번호, 게시글 번호, 댓글 작성자 id, 작성자 닉네임, 신고자 id, 신고 내용, 처리 상태, 신고 시각 
		return reportList;
	}
	
	
	
	
	
	//회원 차단 페이지
	@GetMapping("/block/{userId}")
	public ModelAndView blockMember(@PathVariable String userId, ModelAndView mv) throws Exception {

		
	    //확인
	    	//유저 ID 확인
	    	//현재 차단 여부. 차단기간과 현재시간 비교
	    	//마지막 차단 기간. 차단 상태라면 차단 기간 변경가능. 차단 해제시 endtime을 현재시간으로 변경. 차단 시간 증가 가능
	    	//차단 코멘트 확인
	    	//이전 블라인드 횟수 확인
	    //추가(차단 상태가 아닐시)
	    	//차단기간 설정
	    	//코멘트 

	    
	    //members에서 userid
	    //blind에서 나머지
	    
		
		//차단기간 재설정 시 현재시간보다 이전 시간으로 설정할 때 차단 해제 버튼을 누르라는 알림
		
		
		//기록이 있을 때
			//현재 차단상태일 때
				//기록 표시, 차단기간 설정
			//현재 차단 상태가 아닐 때 
				//기록 표시, 새 차단
		//기록이 없을 때
			//차단 상태가 아님. 새 차단 추가	
	    BlockedMemberVo bvo = rService.getLastBlockInfo(userId);
	    mv.addObject("bvo", bvo);
	    mv.addObject("userId", userId);
	    mv.setViewName("admin/block");
	    return mv;
	}
	
	
	
	
	//차단시간 변경. 현재시간 이하로는 변경 불가
	@PostMapping("/changeBlockT")
	@ResponseBody
	public int changeBlockTime(BlockedMemberVo bvo) {

		System.out.println(bvo);
		int result= rService.changeBlockT(bvo);
		return result;
	}
	//차단시간 변경. 현재시간 이하로는 변경 불가
	@PostMapping("/unblock")
	@ResponseBody
	public int unblock(int blockId) {
		
		int result= rService.unblock(blockId);
		return result;
	}
	
	//차단
	@PostMapping("/block")
	@ResponseBody
	public int block(BlockedMemberVo bvo) {
		System.out.println(bvo);
		int result= rService.block(bvo);
		return result;
	}
	
	
	
}
