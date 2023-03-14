package com.kh.teamproject.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamproject.board.vo.BoardVo;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;

	public int insert(BoardVo vo) throws Exception{		
		return sqlSession.insert("boardMapper.insert",vo);
	}

	public int insertDB(BoardVo vo) {
		return sqlSession.insert("boardMapper.insertDB",vo);
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
	public List<BoardVo> selectList() throws Exception {
		return sqlSession.selectList("boardMapper.selectList");
		
	}

	
}
