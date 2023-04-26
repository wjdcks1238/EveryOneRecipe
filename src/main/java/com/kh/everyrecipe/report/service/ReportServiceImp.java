package com.kh.everyrecipe.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.report.dao.ReportDao;
import com.kh.everyrecipe.report.vo.BlockedMemberVo;
import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCmtVoAll;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;
import com.kh.everyrecipe.report.vo.ReportedPostVoAll;

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
	public List<ReportedPostVoAll> getAllReportedP() {
		return dao.getAllReportedP();
	}
	

	
	@Override
	public List<ReportedCommentVo> getReportedComments() {
		return dao.getReportedComments();
	}

	@Override
	public List<ReportVo> getReportInfoC(String cmtId) {
		return dao.getReportInfoC(cmtId);
	}

	@Override
	public List<ReportedCmtVoAll> getAllReportedC() {
		return dao.getAllReportedC();
	}

	
	
	//회원 블록 관련
	@Override
	public BlockedMemberVo getLastBlockInfo(String userId) {
		return dao.getLastBlockInfo(userId);
	}

	@Override
	public int changeBlockT(BlockedMemberVo bvo) {
		return dao.changeBlockT(bvo);
	}

	@Override
	public int unblock(int blockId) {
		return dao.unblock(blockId);
	}

	@Override
	public int block(BlockedMemberVo bvo) {
		return dao.block(bvo);
	}

	
	//블라인드 토글
	@Override
	public int tgBlindPost(int postId) {
		return dao.tgBlindPost(postId);
	}

	@Override
	public int tgBlindCmt(int cmtId) {
		return dao.tgBlindCmt(cmtId);
	}


	
}
