package com.kh.everyrecipe.postBookmark.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.postBookmark.vo.PostBookmarkVo;


@Repository
public class PostBookmarkDao {
	@Autowired
	private SqlSession sqlSession;


	public int isBookmarked(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("postBookmarkMapper.isBookmarked",map);
	}



	public PostBookmarkVo getBookmarkInfo(Map<String, String> map) {
		return sqlSession.selectOne("postBookmarkMapper.getBookmarkInfo",map);
	}

	public int addBookmark(Map<String, String> map) {
		return sqlSession.insert("postBookmarkMapper.addBookmark",map);
	}
	public int reAddBookmark(Map<String, String> map) {
		return sqlSession.update("postBookmarkMapper.reAddBookmark",map);
	}

	public int removeBookmark(Map<String, String> map) {
		return sqlSession.update("postBookmarkMapper.removeBookmark",map);
	}

	
	
}
