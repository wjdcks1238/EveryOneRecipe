package com.kh.teamproject.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamproject.member.dao.MemberDao;
import com.kh.teamproject.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;

	@Override
	public int insert(MemberVo vo) throws Exception {	
		return dao.insert(vo); 
	}

	@Override
	public int update(MemberVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public int delete(String id) throws Exception {
		return dao.delete(id);
	}

	@Override
	public MemberVo selectOne(String id) throws Exception {
		return dao.selectOne(id);
	}

	@Override
	public List<MemberVo> selectList() throws Exception {
		
		return dao.selectList();
	}
}
