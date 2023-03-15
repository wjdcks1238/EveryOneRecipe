package com.kh.teamproject.post.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamproject.board.service.BoardService;
import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.IngredientVo;

@Controller
public class PostingController {

	@Autowired private BoardService service;
	
	@GetMapping("posting")
	public String postingPage() {
		return "post/posting";
	}
	@PostMapping("posting")
	public ModelAndView post(ModelAndView mv, BoardVo bvo, @RequestParam("ingredient") List<String> ingredients, @RequestParam("amount") List<String> amounts) {
//	public ModelAndView post(ModelAndView mv, BoardVo bvo, String ingredient,String amount) {

		
		
		int lastPostId = service.getLastPostId();
		
		 List<IngredientVo> ivoList = new ArrayList<>();
	     for (int i = 0; i < ingredients.size(); i++) { 
	    	 ivoList.add(new IngredientVo(lastPostId+1, ingredients.get(i), amounts.get(i)));
	     }

	     System.out.println(ivoList);
		System.out.println("----------------");
		//ingVo 배열로 받고 싶음
		System.out.println(bvo);
		
		
		
		
		try {
//			if(service.insertPost(bvo)!=0) {				
//			service.insertIngList(ivoList);
//			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		mv.setViewName("post/posting");
		return mv;
		//json 사용
		//ajax로 받기
		
		
		
	}
	
	@PostMapping("postajax")
	public void postajax(@RequestBody IngredientVo ivo) {
		System.out.println(ivo);
	}
}
