package com.kh.everyrecipe.postLike.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.postLike.service.PostLikeService;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;


@Controller
public class PostLikeController {
	
	@Autowired
	private PostLikeService pService;
	
	@PostMapping("/like")
	@ResponseBody
	public String[] like(Principal principal,int postId) throws Exception {
	

		
		Map<String, String> map = new HashMap<String, String>();
//		회원 id, postId 전달
		map.put("userId",principal.getName() ); 
		map.put("postId", postId+""); 
		
		
		//좋아요 정보를 가져옴
		PostLikeVo pvo= pService.getLikeInfo(map);
		//DB에 정보가 없으면 -> 좋아요
		//isdelete: 'Y'  ->좋아요
		if(pvo==null ) {
			pService.addLike(map);
			pService.getLikeCount(postId);
			String[] array = new String[]{"true",pService.getLikeCount(postId)+"" };
			return array;
		}
		if("Y".equals(pvo.getIsDeleted())) {
			pService.reAddLike(map);
			pService.getLikeCount(postId);
			String[] array = new String[]{"true",pService.getLikeCount(postId)+"" };
			return array;
		}
		
	
		//isdelete: 'N'   -> 좋아요 취소
		if("N".equals(pvo.getIsDeleted()) ) {
			pService.removeLike(map);
			pService.getLikeCount(postId);
			String[] array = new String[]{"false",pService.getLikeCount(postId)+"" };
			return array; 
		}
		
		pService.getLikeCount(postId);
		String[] array = new String[]{"false",pService.getLikeCount(postId)+"" };
		
		return array;
	}

	
}
