package com.kh.everyrecipe.weekboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.weekboard.dao.weekDao;
import com.kh.everyrecipe.weekboard.vo.weekVo;

@Service
public class weekServiceImpl implements weekService {
	@Autowired
	private weekDao dao;
	
	@Override
	public List<weekVo> weekList(){
		return dao.weekList();
	}

}