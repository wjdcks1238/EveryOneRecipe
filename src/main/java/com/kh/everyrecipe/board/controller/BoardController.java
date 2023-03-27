package com.kh.everyrecipe.board.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.HashtagVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.followMapping.service.FollowMappingService;

@Controller
@RequestMapping("/board")
@Transactional
public class BoardController {
		@Autowired
		private BoardService bService;
		@Autowired
		private FollowMappingService fService;
	
//		@GetMapping("/list")
//		public void list() {
//			System.out.println("list~!~!~!~!~!!~");
//		}
		
		@GetMapping("/list")
		public ModelAndView boardList(ModelAndView mv) throws Exception {

			// isdelete 필드가 'N'인 게시글만 불러온다.
			Map<String, Integer> map = new HashMap<>();
			map.put("from", 0);
			map.put("to", 20);
			mv.addObject("postList", bService.pagingList(map));

			mv.setViewName("board/list");
			return mv;
		}
		
		@PostMapping("ISajax")
		@ResponseBody
		public String testAjax( int curPage ) throws Exception {
			List<PostVo> pvoList=null;
//			System.out.println(map.get("curPage"));
//			System.out.println(map.get("pageListSize"));
			System.out.println(curPage);
			int from = (curPage-1)*20;
			int to = from +20;
			Map<String, Integer> map = new HashMap<>();
			map.put("from", from);
			map.put("to", to);
			
			
			
			pvoList= bService.pagingList(map);
		
			return new Gson().toJson(pvoList);
		}
		
		
		
		
		
		@GetMapping("/list/{postId}")
		public ModelAndView boardDetail (ModelAndView mv
				,@PathVariable int postId
				,Principal principal
				) throws Exception {
				
			
			PostVo pvo = bService.selectOne(postId);
			// 없는 게시글 번호로 접근시의 처리 (임시)
			if (pvo == null) {
				mv.setViewName("errors/errorPage");
				return mv;
			}
			// 삭제된 게시물 번호로 접근시의 처리
			if ("Y".equals(pvo.getIsDeleted())) {
				mv.setViewName("errors/deletedPost");
				return mv;
			}
			String hashtags = "";
			mv.addObject("post", pvo);
			List<HashtagVo> hvoList = bService.getHashtags(postId);
			for (HashtagVo hvo : hvoList) {
				hashtags += "#" + hvo.getHashtag();
			}
			mv.addObject("hashtags", hashtags);
			
			//TODO (회원일시) 작성자 팔로우 여부와 좋아요 여부. 전체 팔로워 전체 좋아요
			//작성자 본인이거나 비회원일시 비활성화 
			
			//팔로우 - isdelete N, FWID는 열람중인 회원, USERID는 작성자
			Map<String, String> map1 = new HashMap<String, String>();
			//회원 id, 작성자 id 전달
			map1.put("userId",principal.getName() ); 
			map1.put("fwId", pvo.getUserId() ); 
			
			mv.addObject("isFollowed", ""+fService.isFollowed(map1));
			
			//좋아요 - isdelete N, POSTID, USERID
			Map<String, String> map2 = new HashMap<String, String>();
			//회원 id, 게시글 id 전달
			map2.put("userId",principal.getName() ); 
			map2.put("postId", postId+"" ); 
			
			
			mv.addObject("isLiked",""+fService.isLiked(map2));
			
			
			
			
			
			mv.setViewName("board/detail");
			return mv;
		}
		
	
		
		
		@GetMapping("/list/update/{postId}")
		public ModelAndView boardUpdate (ModelAndView mv
				,@PathVariable int postId
				) throws Exception {
				
		//TODO 작성자가 아닐 때의 처리
		//TODO 없는 게시글 번호로 접근시의 처리
			String hashtags= "";
		
		 	
			PostVo pvo = bService.selectOne(postId);
			// 없는 게시글 번호로 접근시
			if (pvo == null) {
				mv.setViewName("errors/errorPage");
				return mv;
			}
			// 삭제된 게시물 번호로 접근시
			if ("Y".equals(pvo.getIsDeleted())) {
				mv.setViewName("errors/deletedPost");
				return mv;
			}
			mv.addObject("post", pvo);
			// List<HashtagVo>가 아닌 List<String>이 나을 수 있음
			List<HashtagVo> hvoList = bService.getHashtags(postId);
			for (HashtagVo hvo : hvoList) {
				hashtags += "#" + hvo.getHashtag();
			}

			mv.addObject("hashtags", hashtags);
			mv.addObject("ingredients", bService.getIngredients(postId));
			mv.addObject("post", pvo);

			mv.setViewName("board/update");
			return mv;
		}
		
		
		@PostMapping("/list/update")
		public ModelAndView post(ModelAndView mv
				, BoardVo bvo
				, @RequestParam("ingredient") List<String> ingredients
				, @RequestParam("amount") List<String> amounts
				, @RequestParam("hashtag") String hashtag) throws Exception {
				
			//받은 bvo를 그대로 업데이트
			
			 List<IngredientVo> ivoList = new ArrayList<>(); // 공백일 때 처리 필요 
		     for (int i = 0; i < ingredients.size(); i++) { 
		    	 ivoList.add(new IngredientVo(bvo.getPostId(), ingredients.get(i), amounts.get(i)));
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
				
			}
				

			
			if (bService.updatePost(bvo) == 1) {
				// 삭제 후 새로 추가
				bService.deleteIngList(bvo.getPostId());
				bService.deleteHashtagList(bvo.getPostId());
				bService.insertIngList(ivoList);
				// nullpointer 발생하지만 작동은 잘됨..??
				bService.insertHashtagList(hashtagList);

			}
			
				
			
			mv.setViewName("redirect:/board/list/"+bvo.getPostId());
			return mv;

			
		}
		
		
		
		
		@PostMapping("delete")
		public String deletePost(@RequestParam("postId") int postId) throws Exception {
			//게시글의 isdelete필드를 'Y'로 변경. 재료, 해쉬태그는 따로 삭제하지 않는다. 
			int result=0;
						
			result = bService.delete(postId);
			if (result == 1) {
				System.out.println("삭제 성공");
			}
			
			
			return "결과:"+result;	
		}
		
}
