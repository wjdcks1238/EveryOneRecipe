package com.kh.everyrecipe.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.report.vo.BlockedMemberVo;
import com.kh.everyrecipe.report.vo.ReportVo;
import com.kh.everyrecipe.report.vo.ReportedCmtVoAll;
import com.kh.everyrecipe.report.vo.ReportedCommentVo;
import com.kh.everyrecipe.report.vo.ReportedPostVo;
import com.kh.everyrecipe.report.vo.ReportedPostVoAll;

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
	
	//postId로 구분됨
	public List<ReportedPostVo> getReportedPosts() {
		return session.selectList("reportMapper.getReportedPosts");
	}

	public List<ReportVo> getReportInfoP(String postId) {
		return session.selectList("reportMapper.getReportInfoP",postId);
	}
	//postId로 분류하지 않음
	public List<ReportedPostVoAll> getAllReportedP() {
		return session.selectList("reportMapper.getAllReportedP");
	}

	
	
	//신고된 댓글
	public List<ReportedCommentVo> getReportedComments() {
		return session.selectList("reportMapper.getReportedComments");
	}

	public List<ReportVo> getReportInfoC(String cmtId) {
		return session.selectList("reportMapper.getReportInfoC",cmtId);
	}
	//cmtId로 분류하지 않음
	public List<ReportedCmtVoAll> getAllReportedC() {
		return session.selectList("reportMapper.getAllReportedC");
	}

	
	//회원 블록 관련
	public BlockedMemberVo getLastBlockInfo(String userId) {
		return session.selectOne("reportMapper.getLastBlockInfo",userId);
	}

	public int changeBlockT(BlockedMemberVo bvo) {
		return session.update("reportMapper.changeBlockT",bvo);
	}

	public int unblock(int blockId) {
		return session.update("reportMapper.unblock",blockId);
	}

	public int block(BlockedMemberVo bvo) {
		return session.insert("reportMapper.block",bvo);
	}

	public int tgBlindPost(int postId) {
		return session.update("reportMapper.tgBlindPost",postId);
	}

	public int tgBlindCmt(int cmtId) {
		return session.update("reportMapper.tgBlindCmt",cmtId);
	}
	
	
	//차단 기록
	public List<BlockedMemberVo> getBlockInfo(String userId) {
		return session.selectList("reportMapper.getBlockInfo",userId);
	}



}
