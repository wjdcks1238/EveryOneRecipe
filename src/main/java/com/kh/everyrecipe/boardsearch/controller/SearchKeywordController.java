package com.kh.everyrecipe.boardsearch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.everyrecipe.boardsearch.service.BoardSearchService;
import com.kh.everyrecipe.boardsearch.vo.SearchVo;

@Controller
@RequestMapping("/keyword")
@Transactional
public class SearchKeywordController {
	@Autowired
	BoardSearchService bsService;
	
	@GetMapping("/insertdata")
	@ResponseBody
	public int searchInsertDB(
			@RequestParam("keyword") String keyword
			) throws Exception {
		
		// search 테이블에 데이터가 있는지 감별하기 위한 변수
		int dataSearchResult = 0;
		// insert나 update 작업을 하고 난 뒤의 작업 결과를 반환하기 위한 변수
		int modifiedResult = 0;
		
		dataSearchResult = bsService.searchKeyword(keyword);
		
		if(dataSearchResult == 0) {
			//검색결과가 없는 경우, insert문을 실행시켜서 최초 데이터를 삽입
			modifiedResult = bsService.insertSearchData(keyword);
		} else if(dataSearchResult == 1) {
			//검색결과가 있는경우(1개), update문을 실행시켜서 데이터를 갱신
			modifiedResult = bsService.updateSearchData(keyword);
		} else {
			//위 두 조건에 해당되지 않는 경우.
			modifiedResult = -1;
		}
		return modifiedResult;
	}
	
	@GetMapping("/refreshRecommend")
	@ResponseBody
	public String refreshRecommend() throws Exception {
		List<SearchVo> recommendKeyword= bsService.getRecommendSearchKeyword();
		return new Gson().toJson(recommendKeyword);
	}
	
	@GetMapping("/isvisiblekeyword")
	@ResponseBody
	public int isVisibleKeyword(
			@RequestParam("keyword") String keyword
			) throws Exception {
		
		int result = bsService.getkeywordVisibleCount(keyword);
		
		System.out.println(result);
		
		return result;
	}
	
	@GetMapping("/isavailedkeyword")
	@ResponseBody
	public int isAvailedKeyword(
			@RequestParam("keyword") String keyword
			) throws Exception{
		
		int result = bsService.getAvailedKeywordCount(keyword);
		
		System.out.println(result);
		
		return result;
	}
}
