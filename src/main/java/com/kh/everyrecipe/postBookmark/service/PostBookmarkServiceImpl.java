package com.kh.everyrecipe.postBookmark.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.postBookmark.dao.PostBookmarkDao;
import com.kh.everyrecipe.postBookmark.vo.PostBookmarkVo;

@Service
public class PostBookmarkServiceImpl implements PostBookmarkService{
	@Autowired
	private PostBookmarkDao dao;


	@Override
	public boolean isBookmarked(Map<String, String> map) throws Exception {	
		if(dao.isBookmarked(map)==1) {
			return true;
		}
		return false;
	}

	@Override
	public PostBookmarkVo getBookmarkInfo(Map<String, String> map) {
		return dao.getBookmarkInfo(map);
	}

	@Override
	public int addBookmark(Map<String, String> map) {
		return dao.addBookmark(map);
	}

	@Override
	public int reAddBookmark(Map<String, String> map) {
		return dao.reAddBookmark(map);
	}

	@Override
	public int removeBookmark(Map<String, String> map) {
		return dao.removeBookmark(map);
	}

	






	

}
