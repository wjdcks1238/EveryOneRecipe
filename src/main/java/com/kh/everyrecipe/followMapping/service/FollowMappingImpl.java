package com.kh.everyrecipe.followMapping.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.everyrecipe.followMapping.dao.FollowMappingDao;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;

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






	

}
