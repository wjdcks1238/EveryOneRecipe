package com.kh.teamproject.board.service;

import java.util.List;

import com.kh.teamproject.board.vo.BoardVo;




public interface BoardService {
	
	
	
	public int insertDB(BoardVo vo) throws Exception;
	public int insert(BoardVo vo) throws Exception;
	
	public int update(BoardVo vo) throws Exception;
	
	public int delete(String id ) throws Exception;
	
	public BoardVo selectOne(String id) throws Exception ;
	public List<BoardVo> selectList() throws Exception;
}