package com.kh.everyrecipe.member.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.board.vo.BoardManagementDto;
import com.kh.everyrecipe.member.vo.MemberVo;



public interface MemberService {
	
	
	public int insert(MemberVo vo) throws Exception;
	
	public int update(MemberVo vo) throws Exception;
	
	public int delete(String id ) throws Exception;
	
	public MemberVo selectOne(String id) throws Exception ;
	public List<MemberVo> selectList() throws Exception;

	public int updatePI(Map<String, String> map) throws Exception;

	public int deletePI(MemberVo mvo) throws Exception;
	
	public List<MemberVo> selectAuth() throws Exception;
	
	public List<MemberVo> selectList(String keyword) throws Exception;

	public int updateAdmin(Map<String, Object> member) throws Exception;
	
	public int idcheck(String id) throws Exception;

	public List<MemberVo> login(MemberVo vo) throws Exception;
}