package com.kh.everyrecipe.postLike.service;

import java.util.Map;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;


public interface PostLikeService {
	
	public FollowMappingVo getFollowInfo(Map<String, String> map);
	
	public boolean isLiked(Map<String, String> map) throws Exception;

	
	public int addFollower(Map<String, String> map);
	public int reAddFollower(Map<String, String> map);
	public int removeFollower(Map<String, String> map);

	
	
}