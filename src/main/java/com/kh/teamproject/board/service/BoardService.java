package com.kh.teamproject.board.service;

import java.util.List;

import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.HashtagVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.board.vo.PostVo;




public interface BoardService {
	
	
	

	
	
	//Post
	public int getLastPostId();
	public PostVo selectOne(int postId) throws Exception ;
	public List<PostVo> selectList() throws Exception;
	public int insertPost(BoardVo bvo) throws Exception;
	public int updatePost(BoardVo bvo) throws Exception;
	public int insertBasicPost(List<BoardVo> bvoList) throws Exception;
	public int delete(int postId ) throws Exception;
	
	
	//Ingredient
	public List<IngredientVo> getIngredients() throws Exception;
	public List<IngredientVo> getIngredients(int postId) throws Exception;
	public int insertIngList(List<IngredientVo> ivoList) throws Exception;
	public int updateIngList(List<IngredientVo> ivoList) throws Exception;
	
	
	//Hashtag
	public int insertHashtagList(List<HashtagVo> hashtagList) throws Exception;
	public int updateHashtagList(List<HashtagVo> hashtagList) throws Exception;
	public List<HashtagVo> getHashtags(int postId) throws Exception;

	
}