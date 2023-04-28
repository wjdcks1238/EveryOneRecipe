package com.kh.everyrecipe.board.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.ClientChkVo;
import com.kh.everyrecipe.board.vo.HashtagVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.boardsearch.service.BoardSearchService;
import com.kh.everyrecipe.boardsearch.vo.SearchVo;
import com.kh.everyrecipe.comment.replycomment.service.ReplyCommentService;
import com.kh.everyrecipe.comment.replycomment.vo.ReplyCommentVo;
import com.kh.everyrecipe.comment.service.CommentService;
import com.kh.everyrecipe.comment.vo.CommentVo;
import com.kh.everyrecipe.common.BadWordFilter;
import com.kh.everyrecipe.fileutil.FileUtil;
import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;
import com.kh.everyrecipe.postBookmark.service.PostBookmarkService;
import com.kh.everyrecipe.postLike.service.PostLikeService;
import com.kh.everyrecipe.report.service.ReportService;
import com.kh.everyrecipe.report.vo.BlockedMemberVo;

@Controller
@RequestMapping("/board")
@Transactional
public class BoardController {
		@Autowired
		private BoardService bService;
		@Autowired
		private FollowMappingService fService;
		@Autowired
		private PostLikeService pService;
		@Autowired
		private CommentService cmtService;
		@Autowired
		private ReplyCommentService rcmtService;
		@Autowired
		private PostBookmarkService bmService;
		@Autowired
		private MemberService mService;
		@Autowired
		private BoardSearchService bsService;
		@Autowired
		private BadWordFilter badWordFilter;
		@Autowired
		private ReportService rService;
		@Autowired
		@Qualifier("fileUtil")
		private FileUtil fileUtil;
		
		@GetMapping("posting")
		public ModelAndView postingPage(ModelAndView mv, Principal principal) throws Exception {
			String userId= principal.getName();
			String blocked=  mService.selectOne(userId).getIsBlocked();
			if("Y".equals(blocked)) {
				mv.addObject("blocked", "게시글, 댓글 등록 차단 상태입니다.");
				BlockedMemberVo bmvo= rService.getLastBlockInfo(userId);
				String startTime= bmvo.getStartTime().replace("T", " ");
				String endTime=bmvo.getEndTime().replace("T", " ");
				
				mv.addObject("startTime",startTime);
				mv.addObject("endTime", endTime);
				
				mv.setViewName("errors/reason");
				return mv;
			}
			
			mv.setViewName("post/posting");
			return mv;
		}
		
		
		@PostMapping("postajax")
		@ResponseBody
		public String postajax(Principal principal
				, BoardVo bvo
				, @RequestParam("ingredient") List<String> ingredients
				, @RequestParam("amount") List<String> amounts
				, @RequestParam("hashtag") String hashtag
				, @RequestParam(name="image", required = false) MultipartFile multi) throws Exception {
			System.out.println(bvo);
			System.out.println(ingredients);
			System.out.println(amounts);
			System.out.println(hashtag);
			System.out.println(multi);
			
			int lastPostId = bService.getLastPostId();
			
			 List<IngredientVo> ivoList = new ArrayList<>(); // 공백일 때 처리 필요 
		     for (int i = 0; i < ingredients.size(); i++) { 
		    	 ivoList.add(new IngredientVo(lastPostId+1, ingredients.get(i), amounts.get(i)));
		     }
		     if (badWordFilter.containsBadWord(bvo.getContent())||badWordFilter.containsBadWord(ingredients.toString())
				    	||badWordFilter.containsBadWord(amounts.toString())||badWordFilter.containsBadWord(hashtag) 
				    	||badWordFilter.containsBadWord(bvo.getFoodName()) ) {
				return "false";
		
			}
		     
		     //대표 이미지. 업로드 후 리턴받은 url을 컬럼에 넣어야 함
		     Map<String, String> uploadResult = fileUtil.saveFile(multi);
		     uploadResult.get("url") ;
		    

		     
		     //TODO 대표 이미지를 설정하지 않았을 경우 첫번째 이미지가 대표 이미지가 되게 한다.
		     //이미 클라우드에 업로드 되어있어 그냥 url만 컬럼에 넣으면 됨
		     
		     
		     
		     
		    bvo.setUserId(principal.getName());
			MemberVo mvo= mService.selectOne(principal.getName());
			bvo.setNickname(mvo.getNickName());		
				
			if (bService.insertPost(bvo) != 0) {
				bService.insertIngList(ivoList);
			}	
			List<HashtagVo> hashtagList = new ArrayList<>();

			if(!(   ("").equals(hashtag.trim()) || hashtag==null        )) {
				String tag = hashtag.trim();
				System.out.println("tag"+ tag);
				if(    !("#").equals(tag.indexOf(0))  ) {
					tag+="#";
				}
				String[] ht= tag.split("#");
				
				for(String s: ht ) {
					if( !("").equals(s) ) {
						hashtagList.add(new HashtagVo(lastPostId+1, s));
					}
				}
				bService.insertHashtagList(hashtagList);
			}
					
				
				//빈 문자열일 경우
				
				//처음부터 #를 붙이지 않았을 경우  #붙여줌
				
				//trim 후  #으로 나눈다. 띄어쓰기는 고려하지 않음. 해시태그로 저장
				 
				//저장된 순서대로 그대로 출력 
				
				
				
			return "false";
			
		}
		
		
		
		
		
		
		@GetMapping("/search")
		public ModelAndView searchResult(
				ModelAndView mv,
				@RequestParam("keyword") String keyword,
				Principal principal
				) throws Exception {
			//검색어를 입력창에 추가
			System.out.println(keyword);
			mv.addObject("keyword", keyword);
			List<SearchVo> recommendKeyword= bsService.getRecommendSearchKeyword();
			mv.addObject("recommendKey",recommendKeyword);
			
			//isdelete 필드가 'N'인 게시글만 불러온다. 	
			Map<String, String> map = new HashMap<>();
			map.put("from", 0+"");
			map.put("to", 20+"");
			map.put("keyword", keyword);
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			List<PostVo> result = bsService.pagingList(map);
			
			int dataSearchResult = bsService.searchKeyword(keyword);
			if(dataSearchResult == 0) {
				//검색결과가 없는 경우, insert문을 실행시켜서 최초 데이터를 삽입
				bsService.insertSearchData(keyword);
				bsService.insertDB(keyword);
			} else if(dataSearchResult == 1) {
				//검색결과가 있는경우(1개), update문을 실행시켜서 데이터를 갱신
				bsService.updateSearchData(keyword);
				bsService.insertDB(keyword);
			} else {
				//위 두 조건에 해당되지 않는 경우.
			}
			
			mv.addObject("postList", result);
			mv.setViewName("search/result");
			return mv;
		}
		
		@GetMapping("/findfoodajax")
		@ResponseBody
		public String findFoodAjax(
				@RequestParam("keyword") String keyword,
				@RequestParam(value = "option", required = false) String option,
				Principal principal
				) throws Exception {
			
			//isdelete 필드가 'N'인 게시글만 불러온다. 	
			Map<String, String> map = new HashMap<>();
			map.put("from", 0+"");
			map.put("to", 20+"");
			map.put("keyword", keyword);
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			if(option != null) {
				map.put("option", option);
			}
			List<PostVo> result = bsService.pagingList(map);
			int dataSearchResult = bsService.searchKeyword(keyword);
			if(dataSearchResult == 0) {
				//검색결과가 없는 경우, insert문을 실행시켜서 최초 데이터를 삽입
				bsService.insertSearchData(keyword);
				bsService.insertDB(keyword);
			} else if(dataSearchResult == 1) {
				//검색결과가 있는경우(1개), update문을 실행시켜서 데이터를 갱신
				bsService.updateSearchData(keyword);
				bsService.insertDB(keyword);
			} else {
				//위 두 조건에 해당되지 않는 경우.
			}
			System.out.println(result);
			
			return new Gson().toJson(result);
		}
		
		@GetMapping("/findhashajax")
		@ResponseBody
		public String findHashAjax(
				@RequestParam("keyword") String keyword,
				@RequestParam(value = "option", required = false) String option,
				Principal principal
				) throws Exception {
			Map<String, String> map = new HashMap<>();
			map.put("from", 0+"");
			map.put("to", 20+"");
			map.put("keyword", keyword);
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			if(option != null) {
				map.put("option", option);
			}
			List<PostVo> result = bsService.pagingHashList(map);
			bsService.insertHashDB(keyword);
			System.out.println(result);
			
			return new Gson().toJson(result);
		}
		
		
		
		@GetMapping("/findUserIdAjax")
		@ResponseBody
		public String findUserAjax(
				@RequestParam("keyword") String keyword,
				Principal principal
				) throws Exception {
			Map<String, String> map = new HashMap<>();
			map.put("keyword", keyword);
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			List<PostVo> result = bsService.pagingUserList(map);
			System.out.println(result);
			
			return new Gson().toJson(result);
		}
		
		@GetMapping("/findUserNicknameAjax")
		@ResponseBody
		public String findUserNicknameAjax(
				@RequestParam("keyword") String keyword,
				Principal principal
				) throws Exception{
			Map<String, String> map = new HashMap<>();
			map.put("keyword", keyword);
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			List<PostVo> result = bsService.pagingUserNameList(map);
			System.out.println(result);
			
			return new Gson().toJson(result);
		}
		
		@GetMapping("/list")
		public ModelAndView boardList(ModelAndView mv
				, Principal principal
				) throws Exception {
				
		
				//isdelete 필드가 'N'인 게시글만 불러온다. 	
				Map<String, String> map = new HashMap<>();
				map.put("from", 0+"");
				map.put("to", 20+"");
				if(principal!=null) {
					map.put("userId",principal.getName());					
				}
				mv.addObject("postList", bService.pagingList(map));
				
	
			mv.setViewName("board/list");
			return mv;
		}
		
		@PostMapping("ISajax")
		@ResponseBody
		public String testAjax( int curPage, String userId, Principal principal) throws Exception {
			List<PostVo> pvoList=null;
//			System.out.println(map.get("curPage"));
//			System.out.println(map.get("pageListSize"));
			System.out.println(curPage);
			String from = (curPage-1)*20+"";
			String to = ((curPage-1)*20+20)+"";
			Map<String, String> map = new HashMap<>();
			map.put("from", from);
			map.put("to", to);
			if(userId!=null) {				
				map.put("myPage", userId);
			}
			if(principal!=null) {
				map.put("userId",principal.getName());					
			}
			pvoList= bService.pagingList(map);
			
			
			return new Gson().toJson(pvoList);
		}
		
		
		
		
		
		@GetMapping("/list/{postId}")
		public ModelAndView boardDetail (ModelAndView mv
				,@PathVariable int postId
				,Principal principal
				, HttpServletRequest request
				, ClientChkVo chk
				) throws Exception {
				
			
				PostVo pvo = bService.selectOne(postId);
				//없는 게시글 번호로 접근시의 처리 (임시)
				if(pvo ==null) {
					mv.addObject("notExist", "존재하지 않는 게시물입니다.");
					mv.setViewName("errors/reason");
					return mv;
				}
				
				
				//TODO 관리자는 접근 가능하게
				//블라인드된 게시글로 접근
				if("Y".equals(pvo.getIsBlinded())) {
					mv.addObject("blinded", "블라인드 처리된 게시물입니다.");
					mv.setViewName("errors/reason");
					return mv;
				}
				
				//삭제된 게시물 번호로 접근시의 처리
				if("Y".equals(pvo.getIsDeleted())) {
					mv.addObject("deleted", "삭제된 게시물입니다.");
					mv.setViewName("errors/reason");
					return mv;
				}
				
//				MemberVo mvo = mService.selectOne(pvo.getUserId());
//				mv.addObject("member", mvo);
//				bService.selectOne(postId) - id, nickname --> join 
				
				List<HashtagVo> hvoList= bService.getHashtags(postId);
				List<String> hashtagList = new ArrayList<String>();
				for(HashtagVo hvo : hvoList) {
					hashtagList.add("#"+hvo.getHashtag()) ;
				}
				mv.addObject("hashtags",hashtagList );
				List<CommentVo> cvo = cmtService.getCommentList(postId);
				mv.addObject("comment", cvo);
				int cmtCount = cmtService.getCountComment(postId);
				mv.addObject("cmtCount", cmtCount);
				System.out.println(cvo.toString());
				
				
				//(회원일시) 작성자 팔로우 여부와 좋아요 여부.
				//작성자 본인이거나 비회원일시 비활성화 
				//TODO 전체 팔로워 전체 좋아요
				
				//팔로우 - isdelete N, FWID는 열람중인 회원, USERID는 작성자
				Map<String, String> map1 = new HashMap<String, String>();
				//회원 id, 작성자 id 전달
				
				if(principal!=null) {
					map1.put("userId",  pvo.getUserId()); 
					map1.put("fwId",principal.getName() ); 
					
					mv.addObject("isFollowed", fService.isFollowed(map1));
					
					//좋아요 - isdelete N, POSTID, USERID
					Map<String, String> map2 = new HashMap<String, String>();
					//회원 id, 게시글 id 전달
					map2.put("userId",principal.getName() ); 
					map2.put("postId", postId+"" ); 
					
					
					mv.addObject("isLiked",pService.isLiked(map2));
					mv.addObject("isBookmarked",bmService.isBookmarked(map2));
					
					
				}
			
			//게시글 좋아요 수 	
			mv.addObject("likeCount",pService.getLikeCount(postId));
			
			
			// 조회수 중복증가 방지
			String ip = request.getRemoteAddr();
			String browser= request.getHeader("User-Agent");
			
			chk.setIp(ip);
			chk.setBrowser(browser);
			chk.setPostId(postId);
			
					
			int lookUp= bService.upOrNot(chk);
			pvo.setLookUp(lookUp);
			
			//bService.upView(postId);
			mv.addObject("post",pvo);
			mv.setViewName("board/detail");
			return mv;
		}
		
	
		
		
		@GetMapping("/list/update/{postId}")
		public ModelAndView boardUpdate (ModelAndView mv
				,@PathVariable int postId, Principal principal
				) throws Exception {
				
		//TODO 없는 게시글 번호로 접근시의 처리
			String hashtags= "";
		
		 
		 		PostVo pvo = bService.selectOne(postId);	
		 		// 작성자가 아닐 때의 처리
		 		
		 		if(principal==null || !principal.getName().equals(pvo.getUserId())) {
		 			mv.setViewName("redirect:/board/list");
		 			return mv;
		 		}
		 		
		 		//없는 게시글 번호로 접근시
		 		if(pvo ==null) {
					mv.setViewName("errors/errorPage");
					return mv;
				}
				//삭제된 게시물 번호로 접근시
				if("Y".equals(pvo.getIsDeleted())) {
					mv.setViewName("errors/deletedPost");
					return mv;
				}
				
				
				
		 		//List<HashtagVo>가 아닌 List<String>이 나을 수 있음
				List<HashtagVo> hvoList= bService.getHashtags(postId);
				for(HashtagVo hvo : hvoList) {
					hashtags += "#"+hvo.getHashtag();
				}
				
				
				mv.addObject("hashtags",hashtags );
				mv.addObject("ingredients", bService.getIngredients(postId));
				mv.addObject("post", pvo);
			
			mv.setViewName("board/update");
			return mv;
		}
		
		
		@PostMapping("/list/update")
		@ResponseBody
		public String updateajax(Principal principal
				, BoardVo bvo
				, @RequestParam("ingredient") List<String> ingredients
				, @RequestParam("amount") List<String> amounts
				, @RequestParam("hashtag") String hashtag) throws Exception {
				
			//받은 bvo를 그대로 업데이트
			
			//TODO 대표 이미지
			 List<IngredientVo> ivoList = new ArrayList<>(); // 공백일 때 처리 필요 
		     for (int i = 0; i < ingredients.size(); i++) { 
		    	 ivoList.add(new IngredientVo(bvo.getPostId(), ingredients.get(i), amounts.get(i)));
		     }
		     
		     if (badWordFilter.containsBadWord(bvo.getContent())||badWordFilter.containsBadWord(ingredients.toString())
				    	||badWordFilter.containsBadWord(amounts.toString())||badWordFilter.containsBadWord(hashtag) 
				    	||badWordFilter.containsBadWord(bvo.getFoodName()) ) {
				 return "false";
				 
			}
		     
		     
		     
			List<HashtagVo> hashtagList = new ArrayList<>();

			if(!(   ("").equals(hashtag) || hashtag==null        )) {
				String tag = hashtag.trim();
				System.out.println("tag"+ tag);
				if(    !("#").equals(tag.indexOf(0))  ) {
					tag+="#";
				}
				String[] ht= tag.split("#");
				
				for(String s: ht ) {
					if( !("").equals(s) ) {
						hashtagList.add(new HashtagVo(bvo.getPostId(), s));
					}
				}
				bService.deleteHashtagList(bvo.getPostId());  
				//nullpointer 발생하지만 작동은 잘됨..??
				bService.insertHashtagList(hashtagList);
				
			}else {
				bService.deleteHashtagList(bvo.getPostId());  
				
			}
				

		
				bService.updatePost(bvo);
				//삭제 후 새로 추가
				bService.deleteIngList(bvo.getPostId()); 
				bService.insertIngList(ivoList);					
					
				
				
	
			return "true";

			
		}
		
		
		
		
		@PostMapping("delete")
		public void deletePost(@RequestParam("postId") int postId
				, PrintWriter out
				) throws Exception {
			//게시글의 isdelete필드를 'Y'로 변경. 재료, 해쉬태그는 따로 삭제하지 않는다. 
			int result=0;
			System.out.println("ajax작동");
			System.out.println(postId);
		
			result= bService.delete(postId);
			if(result==1) {				
				System.out.println("삭제 성공");
			}
			out.println("결과:"+result);
			out.flush();
			out.close();
//			return ;	
		}
		
		@PostMapping("/insertReplyAjax")
		@ResponseBody
		public String insertReplyAjax(
				CommentVo vo
			  , Principal principal) {
			vo.setUserId(principal.getName());
			
			cmtService.insertComment(vo);
			
			List<CommentVo> replyList = cmtService.getCommentList(vo.getPostId());
			
			return new Gson().toJson(replyList);
		}
		
		@PostMapping("/updateReplyAjax")
		@ResponseBody
		public String updateReplyAjax(
				CommentVo vo) {
			
			cmtService.updateComment(vo);
			
			List<CommentVo> replyList = cmtService.getCommentList(vo.getPostId());
			
			return new Gson().toJson(replyList);
		}
		
		@PostMapping("/deleteReplyAjax")
		@ResponseBody
		public String deleteReplyAjax(
				CommentVo vo) {
			
			cmtService.deleteComment(vo);
			
			List<CommentVo> replyList = cmtService.getCommentList(vo.getPostId());
			
			return new Gson().toJson(replyList);
		}
		
		@PostMapping("/insertReplyCommentAjax")
		@ResponseBody
		public String insertReplyCommentAjax(
				CommentVo cvo
				) {
			ReplyCommentVo vo = new ReplyCommentVo();
			vo.setCmtId(cvo.getCmtId());
			vo.setContent(cvo.getContent());
			vo.setUserId(cvo.getUserId());
			int postId = cvo.getPostId();
			
			rcmtService.insertComment(vo);
			
			List<CommentVo> replyList = cmtService.getCommentList(postId);
			
			return new Gson().toJson(replyList);
		}
}
