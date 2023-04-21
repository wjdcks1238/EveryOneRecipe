package com.kh.everyrecipe.boardsearch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.boardsearch.vo.SearchVo;

@Repository
public class BoardSearchDao {
	@Autowired
	private SqlSession sqlSession;

	public List<PostVo> pagingList(Map<String, String> map) {
		return sqlSession.selectList("boardSearchMapper.pagingList", map);
	}

	public List<PostVo> pagingHashList(Map<String, String> map) {
		return sqlSession.selectList("boardSearchMapper.pagingHashList", map);
	}

	public int searchKeyword(String keyword) {
		return sqlSession.selectOne("boardSearchMapper.selectSearchData", keyword);
	}
	
	public int insertSearchData(String keyword) {
		return sqlSession.insert("boardSearchMapper.insertSearchData", keyword);
	}

	public int updateSearchData(String keyword) {
		return sqlSession.update("boardSearchMapper.updateSearchData", keyword);
	}

	public List<SearchVo> getRecommendSearchKeyword() {
		return sqlSession.selectList("boardSearchMapper.searchRecommendKeyword");
	}

	public List<PostVo> pagingUserList(Map<String, String> map) {
		return sqlSession.selectList("boardSearchMapper.searchUserId", map);
	}

	public List<PostVo> pagingUserNameList(Map<String, String> map) {
		return sqlSession.selectList("boardSearchMapper.searchUserNickname", map);
	}

	public List<SearchVo> rankSearchList() {
		return sqlSession.selectList("boardSearchMapper.rankSearchList");
	}
}
