package com.kh.everyrecipe.comment.replycomment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.comment.replycomment.vo.ReplyCommentVo;

@Repository
public class ReplyCommentDao {
	@Autowired
	private SqlSession session;


	public List<ReplyCommentVo> getCommentList() {
		return session.selectList("ReplyCommentMapper.getReplyCommentList");
	}


	public int insertComment(ReplyCommentVo vo) {
		return session.insert("ReplyCommentMapper.insertReplyComment", vo);
	}
}
