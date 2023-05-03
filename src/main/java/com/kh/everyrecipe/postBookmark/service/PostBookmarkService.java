package com.kh.everyrecipe.postBookmark.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.postBookmark.vo.PostBookmarkVo;



public interface PostBookmarkService {
	
	public boolean isBookmarked(Map<String, String> map) throws Exception;
	public PostBookmarkVo getBookmarkInfo(Map<String, String> map)throws Exception;

	
	public int addBookmark(Map<String, String> map)throws Exception;
	public int reAddBookmark(Map<String, String> map)throws Exception;
	public int removeBookmark(Map<String, String> map)throws Exception;
	public List<Integer> getBookmarkList(String name, int pNum, int limit)throws Exception;
	public int getBookmarkCount(String name);
	public List<BoardVo> getBookmarkPosts(List<Integer> list)throws Exception;

	
	
}