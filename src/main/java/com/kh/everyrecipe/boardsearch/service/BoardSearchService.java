package com.kh.everyrecipe.boardsearch.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.board.vo.PostVo;

public interface BoardSearchService {
	public List<PostVo> pagingList(Map<String, String> map) throws Exception;
}
