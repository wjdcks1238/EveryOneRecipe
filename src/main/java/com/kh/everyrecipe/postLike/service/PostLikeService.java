package com.kh.everyrecipe.postLike.service;

import java.util.Map;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;


public interface PostLikeService {
	
	public PostLikeVo getLikeInfo(Map<String, String> map);
	public boolean isLiked(Map<String, String> map) throws Exception;

	
	public int addLike(Map<String, String> map);
	public int reAddLike(Map<String, String> map);
	public int removeLike(Map<String, String> map);

	
	
}