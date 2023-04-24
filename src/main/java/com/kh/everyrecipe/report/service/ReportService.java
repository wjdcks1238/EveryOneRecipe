package com.kh.everyrecipe.report.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;

public interface ReportService {

	public int submitPostReport(ReportVo vo);
	public int submitCommentReport(ReportVo vo);
	public int reportComment(ReportVo vo);
	public int reportPost(ReportVo vo);
	
	public List<ReportedPostVo> getReportedPosts();
	public List<ReportVo> getReportInfoP(String postId);
	
	public List<ReportedCommentVo> getReportedComments();
	public List<ReportVo> getReportInfoC(String cmtId);

}
