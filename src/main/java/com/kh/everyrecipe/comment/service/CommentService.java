package com.kh.everyrecipe.comment.service;

import java.util.List;

import com.kh.everyrecipe.comment.vo.CommentVo;

public interface CommentService {
	public int getCountComment(int postId);
	public List<CommentVo> getCommentList(int postId);
}
