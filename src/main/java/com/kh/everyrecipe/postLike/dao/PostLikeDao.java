package com.kh.everyrecipe.postLike.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;


@Repository
public class PostLikeDao {
	@Autowired
	private SqlSession sqlSession;


	public int isLiked(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("postLikeMapper.isLiked",map);
	}



	public PostLikeVo getLikeInfo(Map<String, String> map) {
		return sqlSession.selectOne("postLikeMapper.getLikeInfo",map);
	}

	public int addLike(Map<String, String> map) {
		return sqlSession.insert("postLikeMapper.addLike",map);
	}
	public int reAddLike(Map<String, String> map) {
		return sqlSession.update("postLikeMapper.reAddLike",map);
	}

	public int removeLike(Map<String, String> map) {
		return sqlSession.update("postLikeMapper.removeLike",map);
	}

	public int getLikeCount(int postId) {
		return sqlSession.selectOne("postLikeMapper.getLikeCount",postId);
	}



	public List<Integer> getLikeList(String userId, int pNum, int limit) {
		return sqlSession.selectList("postLikeMapper.getLikeList",userId,new RowBounds((pNum-1)*limit, limit));
	}

	public List<BoardVo> getLikePosts(List<Integer> list) {
		return sqlSession.selectList("postLikeMapper.getLikePosts",list);
	}



	public int getLikeCountPaging(String name) {
		return sqlSession.selectOne("postLikeMapper.getLikeCountPaging",name);
	}

	
	
}
