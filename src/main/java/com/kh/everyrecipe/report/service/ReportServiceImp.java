package com.kh.everyrecipe.report.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.report.dao.ReportDao;
import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;

@Service
public class ReportServiceImp implements ReportService {
	@Autowired
	private ReportDao dao;
	
	@Override
	public int submitPostReport(ReportVo vo) {
		return dao.submitPostReport(vo);
	}

	@Override
	public int submitCommentReport(ReportVo vo) {
		return dao.submitCommentReport(vo);
	}

	@Override
	public int reportComment(ReportVo vo) {
		return dao.reportComment(vo);
		
	}

	@Override
	public int reportPost(ReportVo vo) {
		return dao.reportPost(vo);
		
	}

	@Override
	public List<ReportedPostVo> getReportedPosts() {
		return dao.getReportedPosts();
	}

	@Override
	public List<ReportVo> getReportInfoP(String postId) {
		return dao.getReportInfoP(postId);
	}

	@Override
	public List<ReportedCommentVo> getReportedComments() {
		return dao.getReportedComments();
	}

	@Override
	public List<ReportVo> getReportInfoC(String cmtId) {
		return dao.getReportInfoC(cmtId);
	}

	
}
