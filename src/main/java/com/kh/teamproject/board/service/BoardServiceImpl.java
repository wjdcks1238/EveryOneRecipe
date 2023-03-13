package com.kh.teamproject.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamproject.board.dao.BoardDao;
import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.member.vo.MemberVo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

	@Override
	public int insert(BoardVo vo) throws Exception {	
		return dao.insert(vo); 
	}

	@Override
	public int update(BoardVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public int delete(String id) throws Exception {
		return dao.delete(id);
	}

	@Override
	public BoardVo selectOne(String id) throws Exception {
		return dao.selectOne(id);
	}

	@Override
	public List<BoardVo> selectList() throws Exception {
		
		return dao.selectList();
	}
}
