package com.kh.everyrecipe.report.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;

public interface ReportService {

	public int submitPostReport(ReportVo vo);
	public int submitCommentReport(ReportVo vo);
	public void reportComment(ReportVo vo);
	public void reportPost(ReportVo vo);
	public List<ReportedPostVo> getReportedPosts();

}
