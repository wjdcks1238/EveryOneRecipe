package com.kh.teamproject.board.service;

import java.util.List;

import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.HashtagVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.board.vo.PostVo;




public interface BoardService {
	
	
	

	public int insertPost(BoardVo vo) throws Exception;
	
	public int update(BoardVo vo) throws Exception;
	
	public int delete(int postId ) throws Exception;
	
	public PostVo selectOne(int postId) throws Exception ;
	public List<PostVo> selectList() throws Exception;
	public List<IngredientVo> ingredientList() throws Exception;
	
	
	public int insertBasicPost(List<BoardVo> bvoList) throws Exception;



	public int insertIngList(List<IngredientVo> ivoList) throws Exception;

	public int getLastPostId();

	public int insertHashtagList(List<HashtagVo> hashtagList);
}