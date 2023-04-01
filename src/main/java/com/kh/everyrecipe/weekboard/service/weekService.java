package com.kh.everyrecipe.weekboard.service;

import java.util.List;
import java.util.Map;

import com.kh.everyrecipe.weekboard.vo.weekVo;

public interface weekService {

	public List<weekVo> weekList();
	
	public int count() throws Exception;
	
	public List<weekVo> weeklistPage(int displayPost, int postNum) throws Exception;
}
