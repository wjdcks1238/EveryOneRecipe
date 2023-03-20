package com.kh.everyrecipe.shopping;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequiredArgsConstructor
@RestController	//JSON 형태로 객체 데이터 반환
public class SearchController {

    private final NaverShopping naverShop;
    
    @GetMapping("/shoptest")
    public ModelAndView goShopdata(ModelAndView mv) {
    	mv.setViewName("shoptest");
    	return mv;
    }
    
    @RequestMapping(value="/shopdata", method = RequestMethod.GET)
    public ModelAndView getItems(ModelAndView mv
    		, @RequestParam(value="query", required = false) String query) { //query값이 없다면 NULL입력
    	String result = naverShop.search(query);  // query값 = 검색값
    	List<ItemVo> scitem = naverShop.JSONtoItems(result);
    	
    	mv.setViewName("shopdata");
    	mv.addObject("query", scitem);		// List형태의 값을 "query"에 담음	
    	
    	return mv;
    }
}