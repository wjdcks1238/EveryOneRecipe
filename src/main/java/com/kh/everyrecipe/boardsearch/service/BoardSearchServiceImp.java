package com.kh.everyrecipe.boardsearch.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.boardsearch.dao.BoardSearchDao;

@Service
public class BoardSearchServiceImp implements BoardSearchService {
	@Autowired
	private BoardSearchDao dao;

	@Override
	public List<PostVo> pagingList(Map<String, String> map) throws Exception {
		return dao.pagingList(map);
	}

	@Override
	public List<PostVo> pagingHashList(Map<String, String> map) throws Exception {
		return dao.pagingHashList(map);
	}
}
