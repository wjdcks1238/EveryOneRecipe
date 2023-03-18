package com.kh.teamproject.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamproject.board.service.BoardService;
import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.HashtagVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.fileutil.FileUtil;
import com.kh.teamproject.member.vo.MemberVo;

@Controller
@RequestMapping("/board")
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
				//TODO isdelete 필드가 'N'인 게시글만 불러온다. 				
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
				
		//TODO 삭제되었을 때의 처리
		//TODO 없는 게시글 번호로 접근시의 처리
			try {			
				mv.addObject("post", service.selectOne(postId));
				
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
		 		//List<HashtagVo>가 아닌 List<String>이 나을 수 있음
				List<HashtagVo> hvoList= service.getHashtags(postId);
				for(HashtagVo hvo : hvoList) {
					hashtags += hvo.getHashtag();
				}
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {				
				mv.addObject("hashtags",hashtags );
				mv.addObject("ingredients", service.getIngredients(postId));
				mv.addObject("post", service.selectOne(postId));
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
				

			//TODO 업데이트로 변경
			try {
				if(service.updatePost(bvo)!=0) {				
				service.updateIngList(ivoList);
				service.updateHashtagList(hashtagList);
				
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
