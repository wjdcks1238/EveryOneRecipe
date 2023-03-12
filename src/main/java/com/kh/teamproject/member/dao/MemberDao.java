package com.kh.teamproject.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamproject.member.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

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
}
