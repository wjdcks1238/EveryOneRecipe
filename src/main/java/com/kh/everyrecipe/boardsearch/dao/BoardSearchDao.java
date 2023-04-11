package com.kh.everyrecipe.boardsearch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.board.vo.PostVo;

@Repository
public class BoardSearchDao {
	@Autowired
	private SqlSession sqlSession;

	public List<PostVo> pagingList(Map<String, String> map) {
		return sqlSession.selectList("boardSearchMapper.pagingList", map);
	}
}
