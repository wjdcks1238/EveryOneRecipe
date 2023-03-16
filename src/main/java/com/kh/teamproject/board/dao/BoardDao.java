package com.kh.teamproject.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.HashtagVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.board.vo.PostVo;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertPost(BoardVo vo) throws Exception{		
		return sqlSession.insert("boardMapper.insertPost",vo);
	}
	public int insertIngList(List<IngredientVo> ivoList) {
		return sqlSession.insert("boardMapper.insertIngList",ivoList);
	}
	
	public int insertBasicPost(List<BoardVo> bvoList) {
		return sqlSession.insert("boardMapper.insertBasicPost",bvoList);
	}
	public int insertBasicIng(List<IngredientVo> iList) {
		return sqlSession.insert("boardMapper.insertBasicIng",iList);
	}
	
	public int update(BoardVo vo) throws Exception {
		return sqlSession.update("boardMapper.update",vo);
		
	}
	
	public int delete(String postId ) throws Exception {
		return sqlSession.delete("boardMapper.delete",postId);
		
	}
	
	public BoardVo selectOne(String postId) throws Exception {
		return sqlSession.selectOne("boardMapper.selectOne",postId);
		
	}
	public List<PostVo> selectList() throws Exception {
		return sqlSession.selectList("boardMapper.selectList");
		
	}

	public List<IngredientVo> ingredientList() {
		return sqlSession.selectList("boardMapper.ingredientList");
	}
	public int getLastPostId() {
		return sqlSession.selectOne("boardMapper.getLastPostId");
	}
	public int insertHashtagList(List<HashtagVo> hashtagList) {
		return sqlSession.selectOne("boardMapper.insertHashtagList",hashtagList);
	}
	

	

	

	
	
}
