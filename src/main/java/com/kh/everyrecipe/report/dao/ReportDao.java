package com.kh.everyrecipe.report.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.report.vo.ReportVo;

@Repository
public class ReportDao {
	@Autowired
	private SqlSession session;

	public int submitPostReport(ReportVo vo) {
		return session.insert("reportMapper.insertPostReport", vo);
	}

}
