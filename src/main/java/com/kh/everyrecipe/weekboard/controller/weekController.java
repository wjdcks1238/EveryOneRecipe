package com.kh.everyrecipe.weekboard.controller;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.weekboard.service.weekService;
import com.kh.everyrecipe.weekboard.vo.popularVo;
import com.kh.everyrecipe.weekboard.vo.weekVo;

@Controller
@RequestMapping("/board")
public class weekController {
	@Autowired
	private weekService service;
/*  @RequestMapping(value = "/weekboard", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv ) {		
		List<weekVo> weeklist = service.weekList();
		mv.addObject("weekboard", weeklist);
		mv.setViewName("weekboard");
		
		return mv;
	}
*/
	
	// 주간 게시물 + 페이징 처리
	@RequestMapping(value = "/weekboardpage", method = RequestMethod.GET)
	public void weekboardPage(Model model, @RequestParam(value="num", defaultValue = "1") int num) throws Exception {
		// 게시물 총 갯수
		int count = service.count();
		
		// 한페이지 출력 갯수
		int postNum = 10;
		
		// 하단 페이징 번호
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		// 출력 게시물
		int weekPost = (num - 1) * postNum;		
		
		// 한번에 표시할 페이징 번호 갯수
		int pageNum_cnt = 10;
		
		// 표시되는 마지막 번호
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		
		// 표시되는 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);	
		
		// 마지막 번호
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}	
		
		boolean prev = startPageNum == 1? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<weekVo> weeklist = service.weeklistPage(weekPost, postNum);
		model.addAttribute("weekboard", weeklist);
		model.addAttribute("pageNum", pageNum);
		
		// 시작, 끝번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		// 이전, 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);
		
	/*--------------------------------------------------------------------*/	
		// 실시간 인기 검색어
		List<popularVo> pwordlist = service.popularWord();
		model.addAttribute("pword", pwordlist);	
	}
	
	
}
