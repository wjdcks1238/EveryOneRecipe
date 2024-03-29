package com.kh.everyrecipe.followMapping.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.followMapping.vo.FollowVo;
import com.kh.everyrecipe.weekboard.vo.weekVo;


@Repository
public class FollowMappingDao {
	@Autowired
	private SqlSession sqlSession;

	public int isFollowed(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("followMapper.isFollowed",map);
	}

	public int isLiked(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("followMapper.isFollowed",map);
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

	
	public int getFollowerCount(String userId) {
		return sqlSession.selectOne("followMapper.getFollowerCount",userId);
	}

	public int getFollowingCount(String userId) {
		return sqlSession.selectOne("followMapper.getFollowingCount",userId);
	}

	public List<FollowVo> getFollower(Map<String, String> map) {
		return sqlSession.selectList("followMapper.getFollower",map);
	}

	public List<FollowVo> getFollowing(Map<String, String> map) {
		return sqlSession.selectList("followMapper.getFollowing",map);
	}
	
	
	
	// 추천 게시물 피드(좋아요)
	public List<weekVo> getRecommendPost(Map<String, String> recomap){
		return sqlSession.selectList("followMapper.getRecommendPost", recomap);
	}
	
	// 게시물 피드(조회수)
	public List<weekVo> getBestPost(Map<String, String> map){
		return sqlSession.selectList("followMapper.getBestPost", map);
	}
	
	//팔로잉 게시물 피드
	public List<weekVo> getFollowingPost(Map<String, String> fwmap){
		return sqlSession.selectList("followMapper.getFollowingPost", fwmap);
	}

	
	
}
