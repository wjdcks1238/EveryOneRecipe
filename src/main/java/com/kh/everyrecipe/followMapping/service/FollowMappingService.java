package com.kh.everyrecipe.followMapping.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.member.vo.MemberVo;


public interface FollowMappingService {
	
	public boolean isFollowed(Map<String, String> map) throws Exception;
	public FollowMappingVo getFollowInfo(Map<String, String> map) throws Exception;
	
	public int addFollower(Map<String, String> map) throws Exception;
	public int reAddFollower(Map<String, String> map) throws Exception;
	public int removeFollower(Map<String, String> map) throws Exception;

	
	public int getFollowerCount(String userId) throws Exception;
	public int getFollowingCount(String userId) throws Exception;
	
	public List<String>  getFollower(String userId) throws Exception;
	public List<String> getFollowing(String userId) throws Exception;
	
}