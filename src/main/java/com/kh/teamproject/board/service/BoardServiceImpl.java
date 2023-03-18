package com.kh.teamproject.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamproject.board.dao.BoardDao;
import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.HashtagVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.board.vo.PostVo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

	
	//Post
	@Override
	public int getLastPostId() {
		return dao.getLastPostId(); 
	}
	@Override
	public int insertPost(BoardVo vo) throws Exception {	
		return dao.insertPost(vo); 
	}
	@Override
	public int delete(int postId) throws Exception {
		return dao.delete(postId);
	}
	@Override
	public PostVo selectOne(int postId) throws Exception {
		return dao.selectOne(postId);
	}
	@Override
	public List<PostVo> selectList() throws Exception {
		
		return dao.selectList();
	}
	@Override
	public int insertBasicPost(List<BoardVo> bvoList) throws Exception {
		return dao.insertBasicPost(bvoList); 
	}
	@Override
	public int updatePost(BoardVo bvo) throws Exception {
		return dao.updatePost(bvo); 
	}
	
	
	//Ingredient
	@Override
	public List<IngredientVo> getIngredients() throws Exception {
		return dao.getIngredients();
	}
	@Override
	public List<IngredientVo> getIngredients(int postId) throws Exception {
		return dao.getIngredients(postId); 
	}
	@Override
	public int insertIngList(List<IngredientVo> ivoList) throws Exception {
		return dao.insertIngList(ivoList); 
	}
	@Override
	public int updateIngList(List<IngredientVo> ivoList) throws Exception {
		return dao.updateIngList(ivoList); 
	}

	
	//Hashtag

	@Override
	public int insertHashtagList(List<HashtagVo> hashtagList) {
		return dao.insertHashtagList(hashtagList); 
	}
	@Override
	public List<HashtagVo> getHashtags(int postId) throws Exception {
		return dao.getHashtags(postId); 
	}
	@Override
	public int updateHashtagList(List<HashtagVo> hashtagList) throws Exception {
		return dao.updateHashtagList(hashtagList);
	}



	






	


	









	

}
