package com.kh.everyrecipe.member.service;

import java.util.List;

import com.kh.everyrecipe.member.vo.MemberVo;



public interface MemberService {
	
	
	public int insert(MemberVo vo) throws Exception;
	
	public int update(MemberVo vo) throws Exception;
	
	public int delete(String id ) throws Exception;
	
	public MemberVo selectOne(String id) throws Exception ;
	public List<MemberVo> selectList() throws Exception;
}