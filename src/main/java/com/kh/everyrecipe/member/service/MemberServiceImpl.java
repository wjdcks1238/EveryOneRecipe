package com.kh.everyrecipe.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.everyrecipe.member.dao.MemberDao;
import com.kh.everyrecipe.member.vo.MemberVo;

@Transactional
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

	@Override
	public int updatePI(Map<String, String> map) throws Exception {
		return dao.updatePI(map);
	}

	@Override
	public int deletePI(MemberVo mvo) throws Exception {
		return dao.deletePI(mvo);
	}

	@Override
	public int updateAdmin(MemberVo vo) throws Exception {
		return dao.updateAdmin(vo);
	}

	@Override
	public List<MemberVo> selectAuth() throws Exception {
		return dao.selectAuth();
	}

	@Override
	public List<MemberVo> selectList(String keyword) throws Exception {
		return dao.selectList();
	}
	
}
