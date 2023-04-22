package com.kh.everyrecipe.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.report.vo.ReportVo;
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

	public void reportPost(ReportVo vo) {
		session.insert("reportMapper.reportPost", vo);
	}
	public void reportComment(ReportVo vo) {
		session.insert("reportMapper.reportComment", vo);
		
	}

	public List<ReportedPostVo> getReportedPosts() {
		return session.selectList("reportMapper.getReportedPosts");
	}


}
