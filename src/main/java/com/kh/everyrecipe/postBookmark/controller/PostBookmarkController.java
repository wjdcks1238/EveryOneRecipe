package com.kh.everyrecipe.postBookmark.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.postBookmark.service.PostBookmarkService;
import com.kh.everyrecipe.postBookmark.vo.PostBookmarkVo;
import com.kh.everyrecipe.postLike.service.PostLikeService;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;


@Controller
public class PostBookmarkController {
	
	@Autowired
	private PostBookmarkService bmService;
	
	@PostMapping("/bookmark")
	@ResponseBody
	public boolean like(Principal principal,int postId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
//		회원 id, postId 전달
		map.put("userId",principal.getName() ); 
		map.put("postId", postId+""); 
		//북마크 정보를 가져옴
		PostBookmarkVo bmvo= bmService.getBookmarkInfo(map);
		//DB에 정보가 없으면 -> 북마크
		//isdelete: 'Y'  -> 북마크
		if(bmvo==null ) {
			bmService.addBookmark(map);
			return true;
		}
		if("Y".equals(bmvo.getIsDeleted())) {
			bmService.reAddBookmark(map);
			return true;
		}
		//isdelete: 'N'   -> 북마크 취소
		if("N".equals(bmvo.getIsDeleted()) ) {
			bmService.removeBookmark(map);
			return false; 
		}
		return false;
	}

	
}
