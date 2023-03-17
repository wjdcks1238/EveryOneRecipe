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

	@Override
	public int insertPost(BoardVo vo) throws Exception {	
		return dao.insertPost(vo); 
	}


	@Override
	public int update(BoardVo vo) throws Exception {
		return dao.update(vo);
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
	public List<IngredientVo> ingredientList() throws Exception {
		return dao.ingredientList();
	}


	@Override
	public int insertIngList(List<IngredientVo> ivoList) throws Exception {
		return dao.insertIngList(ivoList); 
	}


	@Override
	public int getLastPostId() {
		return dao.getLastPostId(); 
	}


	@Override
	public int insertHashtagList(List<HashtagVo> hashtagList) {
		return dao.insertHashtagList(hashtagList); 
	}

}
