package com.kh.teamproject.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
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
	public ModelAndView post(ModelAndView mv, BoardVo bvo,IngredientVo ivo) {
//	public ModelAndView post(ModelAndView mv, BoardVo bvo, String ingredient,String amount) {

//		System.out.println(ingredient);
//		System.out.println(amount);
		System.out.println(ivo);
		//ingVo 배열로 받고 싶음
		System.out.println(bvo);
		mv.setViewName("post/posting");
		return mv;
		//json 사용
		//ajax로 받기
		
	}
}
