package com.kh.everyrecipe.comment.replycomment.service;

import java.util.List;

import com.kh.everyrecipe.comment.replycomment.vo.ReplyCommentVo;

public interface ReplyCommentService {
	List<ReplyCommentVo> getCommentList();
	int insertComment(ReplyCommentVo vo);
}
