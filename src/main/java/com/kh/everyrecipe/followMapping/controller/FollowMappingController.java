package com.kh.everyrecipe.followMapping.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.weekboard.vo.weekVo;


@Controller
public class FollowMappingController {
	
	@Autowired
	private FollowMappingService fService;
	
	@PostMapping("/follow")
	@ResponseBody
	public boolean follow(Principal principal, String userId) throws Exception {

		
		Map<String, String> map = new HashMap<String, String>();
//		회원 id, 작성자 id 전달
		map.put("userId", userId); 
		map.put("fwId", principal.getName()); 
		
		
		//팔로우 정보를 가져옴
		FollowMappingVo fmVo= fService.getFollowInfo(map);
		//DB에 정보가 없으면 -> 팔로우
		//isdelete: 'Y'  ->팔로우
		if(fmVo==null ) {
			fService.addFollower(map);
			return true;
		}
		if("Y".equals(fmVo.getIsDeleted())) {
			fService.reAddFollower(map);
			return true;
		}
		
	
		//isdelete: 'N'   -> 언팔로우
		if("N".equals(fmVo.getIsDeleted())) {
			fService.removeFollower(map);
			return false; 
		}
		
		
		
		return false;
	}
	
	 @RequestMapping(value = "/board/recommend", method = RequestMethod.GET)
		public ModelAndView getRecommendPost(ModelAndView mv, String userId) {		
			List<weekVo> rcpost = fService.getRecommendPost();
			mv.addObject("rcpost", rcpost);
			
			userId = "user02";
			List<weekVo> fwpost  = fService.getFollowingPost(userId);
			mv.addObject("fwpost", fwpost);		
			
			
			return mv;
		}
	
	
}
