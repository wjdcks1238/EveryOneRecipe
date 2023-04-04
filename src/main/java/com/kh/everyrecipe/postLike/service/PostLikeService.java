package com.kh.everyrecipe.postLike.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.followMapping.vo.FollowMappingVo;
import com.kh.everyrecipe.postLike.vo.PostLikeVo;


public interface PostLikeService {
	
	public PostLikeVo getLikeInfo(Map<String, String> map)throws Exception;
	public boolean isLiked(Map<String, String> map) throws Exception;

	
	public int addLike(Map<String, String> map) throws Exception;
	public int reAddLike(Map<String, String> map) throws Exception;
	public int removeLike(Map<String, String> map) throws Exception;
	public int getLikeCount(int postId) throws Exception;
	public List<Integer> getLikeList(String name)throws Exception;
	public List<BoardVo> getLikePosts(List<Integer> list)throws Exception;

	
	
}