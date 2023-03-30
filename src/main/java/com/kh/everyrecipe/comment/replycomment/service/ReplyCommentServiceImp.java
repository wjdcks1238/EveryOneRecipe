package com.kh.everyrecipe.comment.replycomment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.comment.replycomment.dao.ReplyCommentDao;
import com.kh.everyrecipe.comment.replycomment.vo.ReplyCommentVo;

@Service
public class ReplyCommentServiceImp implements ReplyCommentService{
	@Autowired
	private ReplyCommentDao dao;

	@Override
	public List<ReplyCommentVo> getCommentList(int postId) {
		return dao.getCommentList(postId);
	}

}
