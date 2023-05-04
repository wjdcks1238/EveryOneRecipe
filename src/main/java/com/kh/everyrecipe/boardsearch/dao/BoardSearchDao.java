package com.kh.everyrecipe.boardsearch.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.boardsearch.vo.HashClientChkVo;
import com.kh.everyrecipe.boardsearch.vo.SearchClientChkVo;
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

	public List<SearchVo> selectSearchList() {
		return sqlSession.selectList("boardSearchMapper.selectSearchList");
	}

	public String getkeywordVisible(String keyword) {
		return sqlSession.selectOne("boardSearchMapper.getkeywordvisible", keyword);
	}

	public int swipeVisibleN(String keyword) {
		return sqlSession.update("boardSearchMapper.swipeVisibleN", keyword);
	}

	public int swipeVisibleY(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardSearchMapper.swipeVisibleY", keyword);
	}

	public List<SearchVo> operatorSearchList() {
		return sqlSession.selectList("boardSearchMapper.operatorSearchList");
	}

	public int insertDB(String keyword) {
		return sqlSession.insert("boardSearchMapper.insertDB", keyword);
	}

	public void insertHashDB(HashClientChkVo chk) {
		sqlSession.selectOne("boardSearchMapper.insertHashDB", chk);
	}

	public List<Map<String, String>> selectData(Map<String, String> data) {
		return sqlSession.selectList("boardSearchMapper.selectData", data);
	}

	public List<Map<String, String>> selectDateSearchData(Map<String, String> data) {
		return sqlSession.selectList("boardSearchMapper.selectDateSearchData", data);
	}

	public int upOrNot(SearchClientChkVo chk) {
		System.out.println(chk);
		sqlSession.selectOne("boardSearchMapper.upOrNot", chk);
		
		return chk.getTimes();
	}

	public List<Map<String, String>> getRealTimeSearchTotal() {
		return sqlSession.selectList("boardSearchMapper.getRealTimeSearchTotal");
	}
}
