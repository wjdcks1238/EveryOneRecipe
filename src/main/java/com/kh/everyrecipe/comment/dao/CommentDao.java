package com.kh.everyrecipe.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.comment.vo.CommentVo;

@Repository
public class CommentDao {
	@Autowired
	SqlSession session;
	
	public int getCountComment(int postId) {
		int result = session.selectOne("commentMapper.getCommentCount", postId);
		return result;
	}

	public List<CommentVo> getCommentList(int postId) {
		return session.selectList("commentMapper.getCommentList", postId);
	}

}
