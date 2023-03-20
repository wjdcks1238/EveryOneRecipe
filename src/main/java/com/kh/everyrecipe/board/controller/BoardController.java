package com.kh.everyrecipe.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.HashtagVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;

@Controller
@RequestMapping("/board")
@Transactional
public class BoardController {
		@Autowired
		private BoardService service;
	
//		@GetMapping("/list")
//		public void list() {
//			System.out.println("list~!~!~!~!~!!~");
//		}
		
		@GetMapping("/list")
		public ModelAndView boardList(ModelAndView mv
				) {
				
			
			try {
				//isdelete 필드가 'N'인 게시글만 불러온다. 				
				mv.addObject("postList", service.selectList());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/list");
			return mv;
		}
		
		@GetMapping("/list/{postId}")
		public ModelAndView boardDetail (ModelAndView mv
				,@PathVariable int postId
				) {
				

		
			
			
			try {			
				PostVo pvo = service.selectOne(postId);
				//없는 게시글 번호로 접근시의 처리 (임시)
				if(pvo ==null) {
					mv.setViewName("errors/errorPage");
					return mv;
				}
				//삭제된 게시물 번호로 접근시의 처리
				if("Y".equals(pvo.getIsDeleted())) {
					mv.setViewName("errors/deletedPost");
					return mv;
				}
				mv.addObject("post",pvo);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/detail");
			return mv;
		}
		
	
		
		
		@GetMapping("/list/update/{postId}")
		public ModelAndView boardUpdate (ModelAndView mv
				,@PathVariable int postId
				) {
				
		//TODO 작성자가 아닐 때의 처리
		//TODO 없는 게시글 번호로 접근시의 처리
			String hashtags= "";
		
		 	try {
		 		PostVo pvo = service.selectOne(postId);	
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
				mv.addObject("post",pvo);
		 		//List<HashtagVo>가 아닌 List<String>이 나을 수 있음
				List<HashtagVo> hvoList= service.getHashtags(postId);
				for(HashtagVo hvo : hvoList) {
					hashtags += "#"+hvo.getHashtag();
				}
				
			
				mv.addObject("hashtags",hashtags );
				mv.addObject("ingredients", service.getIngredients(postId));
				mv.addObject("post", pvo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/update");
			return mv;
		}
		
		
		@PostMapping("/list/update")
		public ModelAndView post(ModelAndView mv
				, BoardVo bvo
				, @RequestParam("ingredient") List<String> ingredients
				, @RequestParam("amount") List<String> amounts
				, @RequestParam("hashtag") String hashtag) {
				
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
				

			try {
				if(service.updatePost(bvo)==1) {	
				//삭제 후 새로 추가
				service.deleteIngList(bvo.getPostId()); 
				service.deleteHashtagList(bvo.getPostId());  
				service.insertIngList(ivoList);
				//nullpointer 발생하지만 작동은 잘됨..??
				service.insertHashtagList(hashtagList);
					
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
				
			
			mv.setViewName("board/list");
			return mv;

			
		}
		
		
		
		
		@PostMapping("delete")
		public String deletePost(@RequestParam("postId") int postId) {
			//게시글의 isdelete필드를 'Y'로 변경. 재료, 해쉬태그는 따로 삭제하지 않는다. 
			int result=0;
			System.out.println("ajax작동");
			System.out.println(postId);
			
			try {
				result= service.delete(postId);
				if(result==1) {				
					System.out.println("삭제 성공");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "결과:"+result;	
		}
		
}
