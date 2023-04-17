package com.kh.everyrecipe.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.board.dao.BoardDao;
import com.kh.everyrecipe.board.vo.BoardManagementDto;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.HashtagVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.board.vo.RecommendVo;

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
	@Override
	public List<PostVo> pagingList(Map<String, String> map) throws Exception {
		return dao.pagingList(map);
	}
	@Override
	public int upView(int postId) throws Exception {
		return dao.upView(postId);
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
	public List<String> searchIng(String ing) throws Exception {
		return dao.searchIng(ing); 
	}
	
	@Override
	public int insertIngList(List<IngredientVo> ivoList) throws Exception {
		return dao.insertIngList(ivoList); 
	}
	@Override
	public int deleteIngList(int postId) throws Exception {
		return dao.deleteIngList(postId); 
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
	public int deleteHashtagList(int postId) throws Exception {
		return dao.deleteHashtagList(postId);
	}
	
	
	
	
	
	//Recommend
	@Override
	public List<RecommendVo> getIngForRec(List<String> chosenList) throws Exception {
		return dao.getIngForRec(chosenList);
	}

	
	// 관리자 회원별 작성 글 관리
	@Override
	public List<BoardManagementDto> boardManagementList() throws Exception {
		return dao.boardManagementList();
	}





	






	


	









	

}
