package com.kh.teamproject.post.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.IngredientVo;

@Controller
public class PostingController {

	@GetMapping("posting")
	public String postingPage() {
		
		return "post/posting";
	}
	@PostMapping("posting")
	public ModelAndView post(ModelAndView mv, BoardVo bvo, @RequestParam("ingredient") List<String> ingredients, @RequestParam("amount") List<String> amounts) {
//	public ModelAndView post(ModelAndView mv, BoardVo bvo, String ingredient,String amount) {

//		System.out.println(ingredient);
//		System.out.println(amount);
		
		
		 List<IngredientVo> ivo = new ArrayList<>();
	     for (int i = 0; i < ingredients.size(); i++) { 
	    	 ivo.add(new IngredientVo(0, ingredients.get(i), amounts.get(i)));
	     }

	     System.out.println(ivo);
		System.out.println("----------------");
		//ingVo 배열로 받고 싶음
		System.out.println(bvo);
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
