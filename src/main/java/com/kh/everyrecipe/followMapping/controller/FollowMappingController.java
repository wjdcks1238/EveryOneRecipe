package com.kh.everyrecipe.followMapping.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.everyrecipe.followMapping.service.FollowMappingService;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;


@Controller
public class FollowMappingController {
	
	@Autowired
	private FollowMappingService fService;
	
	@PostMapping("/follow")
	@ResponseBody
	public boolean follow(String isFollowed, Principal principal, String fwId) throws Exception {
		System.out.println(isFollowed);

		
		Map<String, String> map = new HashMap<String, String>();
//		회원 id, 작성자 id 전달
		map.put("userId",principal.getName() ); 
		map.put("fwId", fwId); 
		
		
		//팔로우 정보를 가져옴
		FollowMappingVo fmVo= fService.getFollowInfo(map);
		//DB에 정보가 없으면 -> 팔로우
		//isdelete: 'Y'  ->팔로우
		if(fmVo==null ) {
			fService.addFollower(map);
			return true;
		}
		if("Y".equals(fmVo.getISDELETED())) {
			fService.reAddFollower(map);
			return true;
		}
		
	
		//isdelete: 'N'   -> 언팔로우
		if("N".equals(fmVo.getISDELETED()) ) {
			fService.removeFollower(map);
			return false; 
		}
		
		
		
		return false;
	}
	
}
