package com.kh.everyrecipe.followMapping.service;

import java.util.Map;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;


public interface FollowMappingService {
	
	public boolean isFollowed(Map<String, String> map) throws Exception;
	public FollowMappingVo getFollowInfo(Map<String, String> map);
	

	
	public int addFollower(Map<String, String> map);
	public int reAddFollower(Map<String, String> map);
	public int removeFollower(Map<String, String> map);

	
	
}