package com.kh.everyrecipe.post.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.lang3.StringUtils;
import com.google.gson.JsonObject;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.HashtagVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;

@Controller
public class PostingController {

	@Autowired private BoardService bService;
	@Autowired private MemberService mService;
	
	
	@GetMapping("posting")
	public String postingPage() {
		return "post/posting";
	}
	@PostMapping("posting")
	public ModelAndView post(ModelAndView mv
			, Principal principal
			, BoardVo bvo
			, @RequestParam("ingredient") List<String> ingredients
			, @RequestParam("amount") List<String> amounts
			, @RequestParam("hashtag") String hashtag) throws Exception {
//	public ModelAndView post(ModelAndView mv, BoardVo bvo, String ingredient,String amount) {

		
		
		int lastPostId = bService.getLastPostId();
		
		 List<IngredientVo> ivoList = new ArrayList<>(); // 공백일 때 처리 필요 
	     for (int i = 0; i < ingredients.size(); i++) { 
	    	 ivoList.add(new IngredientVo(lastPostId+1, ingredients.get(i), amounts.get(i)));
	     }
	    System.out.println(ivoList);
		System.out.println("----------------");

		System.out.println(bvo);
		
		bvo.setUserId(principal.getName());
		MemberVo mvo= mService.selectOne(principal.getName());
		bvo.setNickname(mvo.getNickName());		
		
		
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
					hashtagList.add(new HashtagVo(lastPostId+1, s));
				}
			}
			
		}
			
		
		//빈 문자열일 경우
		
		//처음부터 #를 붙이지 않았을 경우  #붙여줌
		
		//trim 후  #으로 나눈다. 띄어쓰기는 고려하지 않음. 해시태그로 저장
	
			
		//
		//#abv#adf abc 라면??
		//
		 
		//저장된 순서대로 그대로 출력 
		
		
		try {
			if(bService.insertPost(bvo)!=0) {				
			bService.insertIngList(ivoList);
			bService.insertHashtagList(hashtagList);
			
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		
		mv.setViewName("redirect:/board/list/");
		return mv;

		
	}

	
	
}
