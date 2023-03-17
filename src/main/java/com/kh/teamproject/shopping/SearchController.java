package com.kh.teamproject.shopping;

import lombok.RequiredArgsConstructor;
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

    @RequestMapping(value="/shoptest", method = RequestMethod.GET)
    public ModelAndView getItems(ModelAndView mv
    		, @RequestParam(value="query", defaultValue = "우유") String query) {  //임시로 우유값을 넣음
    	String result = naverShop.search(query);  // query값 = 입력값
    	List<ItemVo> scitem = naverShop.JSONtoItems(result);
    	mv.addObject("query", scitem);		// List형태의 값을 "query"에 담음
    	mv.setViewName("/shoptest");    	
    	
    	return mv;
    }
}