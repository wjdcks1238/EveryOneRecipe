package com.kh.everyrecipe.postBookmark.service;

import java.util.Map;


import com.kh.everyrecipe.postBookmark.vo.PostBookmarkVo;



public interface PostBookmarkService {
	
	public boolean isBookmarked(Map<String, String> map) throws Exception;
	public PostBookmarkVo getBookmarkInfo(Map<String, String> map);

	
	public int addBookmark(Map<String, String> map);
	public int reAddBookmark(Map<String, String> map);
	public int removeBookmark(Map<String, String> map);

	
	
}