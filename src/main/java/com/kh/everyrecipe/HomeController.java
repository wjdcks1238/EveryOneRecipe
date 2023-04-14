package com.kh.everyrecipe;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import com.kh.everyrecipe.weekboard.service.weekService;
import com.kh.everyrecipe.weekboard.vo.popularVo;
import com.kh.everyrecipe.weekboard.vo.weekVo;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//예외처리 메서드
//	@ExceptionHandler(Exception.class)
//	public String catcher(Exception ex) {
//		return "errorPage";
//	}
	@Autowired
	private weekService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String home(Locale locale, Model model,
			@RequestParam(value="num", defaultValue = "1") int num) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		

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
		
		return "home";
	}
	

}
