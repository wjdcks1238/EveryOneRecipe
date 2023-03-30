package com.kh.everyrecipe.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.comment.dao.CommentDao;
import com.kh.everyrecipe.comment.vo.CommentVo;

@Service
public class CommentServiceImp implements CommentService{
	@Autowired
	private CommentDao dao;

	@Override
	public int getCountComment(int postId) {
		return dao.getCountComment(postId);
	}

	@Override
	public List<CommentVo> getCommentList(int postId) {
		return dao.getCommentList(postId);
	}

	@Override
	public int insertComment(CommentVo vo) {
		return dao.insertComment(vo);
	}

	@Override
	public int deleteComment(CommentVo vo) {
		return dao.deleteComment(vo);
	}
	
}
