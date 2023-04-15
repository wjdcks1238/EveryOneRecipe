package com.kh.everyrecipe.followMapping.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.member.vo.MemberVo;
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

	public List<String> getFollower(String userId) {
		return sqlSession.selectList("followMapper.getFollower",userId);
	}

	public List<String> getFollowing(String userId) {
		return sqlSession.selectList("followMapper.getFollowing",userId);
	}
	
	
	
	// 추천 게시물 피드
	public List<weekVo> getRecommendPost(){
		return sqlSession.selectList("followMapper.getRecommendPost");
	}
	// 좋아요 갯수
	public List<Integer> getPostLikeCnt(){
		return sqlSession.selectList("followMapper.getPostLikeCnt");
	}
	
	//팔로잉 게시물 피드
	public List<weekVo> getFollowingPost(String userId){
		return sqlSession.selectList("followMapper.getFollowingPost", userId);
	}

	
	
}
