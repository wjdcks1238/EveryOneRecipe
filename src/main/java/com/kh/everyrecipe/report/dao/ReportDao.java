package com.kh.everyrecipe.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;

@Repository
public class ReportDao {
	@Autowired
	private SqlSession session;

	public int submitPostReport(ReportVo vo) {
		return session.insert("reportMapper.insertPostReport", vo);
	}

	public int submitCommentReport(ReportVo vo) {
		return session.insert("reportMapper.insertCommentReport", vo);
	}

	public int reportPost(ReportVo vo) {
		session.insert("reportMapper.reportPost", vo);
		return vo.getCmtId(); 
	}
	public int reportComment(ReportVo vo) {
		session.insert("reportMapper.reportComment", vo);
		return vo.getPostId();
		
	}

	//신고된 게시물
	public List<ReportedPostVo> getReportedPosts() {
		return session.selectList("reportMapper.getReportedPosts");
	}

	public List<ReportVo> getReportInfoP(String postId) {
		return session.selectList("reportMapper.getReportInfoP",postId);
	}

	//신고된 댓글
	public List<ReportedCommentVo> getReportedComments() {
		return session.selectList("reportMapper.getReportedComments");
	}

	public List<ReportVo> getReportInfoC(String cmtId) {
		return session.selectList("reportMapper.getReportInfoC",cmtId);
	}


}
