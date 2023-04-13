package com.kh.everyrecipe.report.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.report.dao.ReportDao;
import com.kh.everyrecipe.report.vo.ReportVo;

@Service
public class ReportServiceImp implements ReportService {
	@Autowired
	private ReportDao dao;
	
	@Override
	public int submitPostReport(ReportVo vo) {
		return dao.submitPostReport(vo);
	}

}
