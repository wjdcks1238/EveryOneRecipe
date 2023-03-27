package com.kh.everyrecipe.postLike.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;


@Repository
public class PostLikeDao {
	@Autowired
	private SqlSession sqlSession;

	public int isFollowed(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("followMapper.isFollowed",map);
	}

	public int isLiked(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("followMapper.isFollowed",map);
	}

	public int toggleFollow(Map<String, String> map) {
		return sqlSession.update("followMapper.toggleFollow",map);
	}

	public FollowMappingVo getFollowInfo(Map<String, String> map) {
		return sqlSession.selectOne("followMapper.getFollowInfo",map);
	}

	public int addFollower(Map<String, String> map) {
		return sqlSession.insert("followMapper.addFollower",map);
	}
	public int reAddFollower(Map<String, String> map) {
		return sqlSession.update("followMapper.reAddFollower",map);
	}

	public int removeFollower(Map<String, String> map) {
		return sqlSession.update("followMapper.removeFollower",map);
	}

	
	
}
