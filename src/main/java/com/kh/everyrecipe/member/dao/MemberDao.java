package com.kh.everyrecipe.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.member.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	//회원가입
	public int insert(MemberVo vo) throws Exception{		
		return sqlSession.insert("memberMapper.insertId",vo);
	}
	
	public int update(MemberVo vo) throws Exception {
		return sqlSession.update("memberMapper.update",vo);
		
	}
	
	public int delete(String id ) throws Exception {
		return sqlSession.delete("memberMapper.delete",id);
		
	}
	
	public MemberVo selectOne(String id) throws Exception {
		return sqlSession.selectOne("memberMapper.selectOne",id);
		
	}
	public List<MemberVo> selectList() throws Exception {
		return sqlSession.selectList("memberMapper.selectList");
		
	}

	public int updatePI(Map<String, String> map) {
		return sqlSession.update("memberMapper.updatePI",map);
	}

	public int deletePI(MemberVo mvo) {
		return sqlSession.update("memberMapper.deletePI",mvo);
	}
	
	public int updateAdmin(Map<String, Object> member) throws Exception {
		
		return sqlSession.update("memberMapper.updateAdmin", member);
	}
	
	public List<MemberVo> selectAuth() throws Exception {
	    return sqlSession.selectList("memberMapper.selectAuth");
	}

	public int idcheck(String id) throws Exception {
		return sqlSession.selectOne("memberMapper.idcheck", id);
	}

	public List<MemberVo> login(MemberVo vo) throws Exception {
		return sqlSession.selectList("memberMapper.login", vo);
	}
	//check password before myinfo update
	//개인정보 수정전 비밀번호 확인
	public int loginForMyInfo(String id, String password) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		return sqlSession.selectOne("memberMapper.loginForMyInfo",map);
	}
	public int modify(MemberVo vo) throws Exception {
		return sqlSession.update("memberMapper.modify",vo);
		
	}
}
