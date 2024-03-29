package com.kh.everyrecipe.followMapping.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.followMapping.dao.FollowMappingDao;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.followMapping.vo.FollowVo;
import com.kh.everyrecipe.weekboard.vo.weekVo;

@Service
public class FollowMappingImpl implements FollowMappingService{
	@Autowired
	private FollowMappingDao dao;

	
	@Override
	public boolean isFollowed(Map<String, String> map) throws Exception {

		 
		if(dao.isFollowed(map)==1) {
			System.out.println("dao if문 true");
			return true;
		}
		return false;
//		return dao.isFollowed(map);
	}


	@Override
	public FollowMappingVo getFollowInfo(Map<String, String> map) {
		return dao.getFollowInfo(map);
	}

	
	@Override
	public int addFollower(Map<String, String> map) {
		return dao.addFollower(map);
	}
	@Override
	public int reAddFollower(Map<String, String> map) {
		return dao.reAddFollower(map);
	}

	@Override
	public int removeFollower(Map<String, String> map) {
		return dao.removeFollower(map);
	}


	@Override
	public int getFollowerCount(String userId) throws Exception {
		return dao.getFollowerCount(userId);
	}


	@Override
	public int getFollowingCount(String userId) throws Exception {
		return dao.getFollowingCount(userId);
	}


	@Override
	public List<FollowVo> getFollower(Map<String, String> map) throws Exception {
		return dao.getFollower(map);
	}


	@Override
	public List<FollowVo> getFollowing(Map<String, String> map) throws Exception {
		return dao.getFollowing(map);
	}


	
	
	@Override
	public List<weekVo> getRecommendPost(Map<String, String> recomap) {
		return dao.getRecommendPost(recomap);
	}	
	
	@Override
	public List<weekVo> getBestPost(Map<String, String> map){
		return dao.getBestPost(map);
	}	
	
	@Override
	public List<weekVo> getFollowingPost(Map<String, String> fwmap){
		return dao.getFollowingPost(fwmap);
	}






	

}
