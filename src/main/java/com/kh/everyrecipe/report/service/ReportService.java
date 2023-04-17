package com.kh.everyrecipe.report.service;

import java.util.Map;

import com.kh.everyrecipe.report.vo.ReportVo;

public interface ReportService {

	public int submitPostReport(ReportVo vo);
	public int submitCommentReport(ReportVo vo);

}
