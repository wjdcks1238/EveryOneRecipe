package com.kh.everyrecipe.boardsearch.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.boardsearch.vo.SearchVo;

public interface BoardSearchService {
	public List<PostVo> pagingList(Map<String, String> map) throws Exception;
	public List<PostVo> pagingHashList(Map<String, String> map) throws Exception;
	public int searchKeyword(String keyword) throws Exception;
	public int insertSearchData(String keyword) throws Exception;
	public int updateSearchData(String keyword) throws Exception;
	public List<SearchVo> getRecommendSearchKeyword() throws Exception;
	public List<PostVo> pagingUserList(Map<String, String> map) throws Exception;
	public List<PostVo> pagingUserNameList(Map<String, String> map) throws Exception;
	public List<SearchVo> rankSearchList() throws Exception;
	public List<SearchVo> selectSearchList() throws Exception;
	public String getkeywordVisible(String keyword) throws Exception;
	public int swipeVisibleN(String keyword) throws Exception;
	public int swipeVisibleY(String keyword) throws Exception;
	public List<SearchVo> operatorSearchList() throws Exception;
	public int insertDB(String keyword) throws Exception;
	public int insertHashDB(String keyword) throws Exception;
	public List<Map<String, String>> selectData(Map<String, String> data) throws Exception;
	public List<Map<String, String>> selectDateSearchData(Map<String, String> data) throws Exception;
}
