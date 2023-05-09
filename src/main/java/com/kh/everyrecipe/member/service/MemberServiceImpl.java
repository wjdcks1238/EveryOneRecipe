package com.kh.everyrecipe.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.everyrecipe.member.dao.MemberDao;
import com.kh.everyrecipe.member.vo.MemberBlockVo;
import com.kh.everyrecipe.member.vo.MemberModifyDto;
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
	public List<MemberVo> selectList(String keyword) throws Exception {
		return dao.selectList();
	}

	@Override
	public List<MemberVo> selectAuth() throws Exception {
	    return dao.selectAuth();
	}


	@Override
	public int updateAdmin(Map<String, Object> member) throws Exception {
		return dao.updateAdmin(member);
	}

	@Override
	public int idcheck(String id) throws Exception {
		return dao.idcheck(id);
	}


	@Override
	public int modify(MemberModifyDto mvo) throws Exception {
		return dao.modify(mvo);
	}

	@Override
	public int loginForMyInfo(Map<String, String> map) throws Exception {
		return dao.loginForMyInfo(map);
	}

	@Override
	public String getBlockData(String name) throws Exception {
		return dao.getBlockData(name);
	}

	@Override
	public MemberBlockVo getUserBlock(String name) throws Exception {
		return dao.getUserBlock(name);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int memberDelete(String id) throws Exception {
		return dao.memberDelete(id);
	}

	@Override
	public int encodePassword(MemberVo vo) throws Exception {
		return dao.encodePassword(vo);
	}






	
}
