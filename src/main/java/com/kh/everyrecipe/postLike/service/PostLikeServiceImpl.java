package com.kh.everyrecipe.postLike.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.everyrecipe.postLike.dao.PostLikeDao;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;

@Service
public class PostLikeServiceImpl implements PostLikeService{
	@Autowired
	private PostLikeDao dao;


	@Override
	public boolean isLiked(Map<String, String> map) throws Exception {	
		if(dao.isLiked(map)==1) {
			return true;
		}
		return false;
	}

	@Override
	public PostLikeVo getLikeInfo(Map<String, String> map) {
		return dao.getLikeInfo(map);
	}

	@Override
	public int addLike(Map<String, String> map) {
		return dao.addLike(map);
	}

	@Override
	public int reAddLike(Map<String, String> map) {
		return dao.reAddLike(map);
	}

	@Override
	public int removeLike(Map<String, String> map) {
		return dao.removeLike(map);
	}

	@Override
	public int getLikeCount(int postId) throws Exception {
		return dao.getLikeCount(postId);
	}

	






	

}
