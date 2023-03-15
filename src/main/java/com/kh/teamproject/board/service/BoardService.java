package com.kh.teamproject.board.service;

import java.util.List;

import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.board.vo.PostVo;




public interface BoardService {
	
	
	

	public int insert(BoardVo vo) throws Exception;
	
	public int update(BoardVo vo) throws Exception;
	
	public int delete(String id ) throws Exception;
	
	public BoardVo selectOne(String id) throws Exception ;
	public List<PostVo> selectList() throws Exception;
	public List<IngredientVo> ingredientList() throws Exception;
	
	
	public int insertBasicPost(List<BoardVo> bvoList) throws Exception;

	public int insertBasicIng(List<IngredientVo> iList) throws Exception;
}