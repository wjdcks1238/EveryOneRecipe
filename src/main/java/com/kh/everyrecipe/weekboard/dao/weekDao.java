package com.kh.everyrecipe.weekboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.weekboard.vo.weekVo;

@Repository
public class weekDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<weekVo> weekList() {
		return sqlSession.selectList("weekMapper.list");
	}
}
