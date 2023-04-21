package com.kh.everyrecipe.report.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everyrecipe.report.service.ReportService;
import com.kh.everyrecipe.report.vo.ReportVo;

@Controller
@RequestMapping("/report")
@Transactional
public class ReportController {
	@Autowired
	private ReportService rService;
	
	@GetMapping("/post")
	public ModelAndView postReport(
			ModelAndView mv,
			@RequestParam("title") String title,
			@RequestParam("context") String context,
			@RequestParam("postId") int postId,
			Principal principal
			) {
		
		mv.addObject("foodName", title);
		mv.addObject("context", context);
		mv.addObject("postId", postId);
		
		mv.setViewName("report/post_report");
		
		return mv;
	}
	
	@PostMapping("/post")
	@ResponseBody
	public int ajaxPostReport(
			@RequestParam("selectedRadio") String selectedRadio,
			@RequestParam(value = "otherReportContext", required = false) String reportContext,
			@RequestParam("postId") int postId,
			ReportVo vo,
			Principal principal
			) {
		String reportContent;
		int result = -1;
		
		System.out.println(selectedRadio);
		System.out.println(reportContext);
		System.out.println(postId);
		
		if(reportContext != "") {
			reportContent = selectedRadio + " | " + reportContext;
		} else {
			reportContent = selectedRadio;
		}
		vo.setPostId(postId);
		vo.setReportContent(reportContent);
		vo.setUserId(principal.getName());
		vo.setReportType('p');
		
		
//		result = rService.submitPostReport(vo);
		rService.reportPost(vo);
		
		
		return result;
	}
	
	@GetMapping("comment")
	public ModelAndView commentReport(
			ModelAndView mv,
			@RequestParam("cmtId") int cmtId,
			@RequestParam("content") String content,
			@RequestParam("reportUser") String reportUser,
			Principal principal
			) {
		String userName = principal.getName();
		System.out.println(cmtId);
		System.out.println(content);
		System.out.println(reportUser);
		System.out.println(userName);
		
		mv.addObject("cmtId", cmtId);
		mv.addObject("content", content);
		mv.addObject("reportUser", reportUser);
		mv.addObject("userName", userName);
		
		mv.setViewName("report/comment_report");
		return mv;
	}
	
	@PostMapping("comment")
	@ResponseBody
	public int ajaxCommentReport(
			@RequestParam("selectedRadio") String selectedRadio,
			@RequestParam("otherReportContext") String otherReportContext,
			@RequestParam("cmtId") int cmtId,
			ReportVo vo,
			Principal principal
			) {
		int result = -1;
		String reportContent="";
		vo.setUserId(principal.getName());
		vo.setCmtId(cmtId);
		
		if(otherReportContext != "") {
			reportContent = selectedRadio + " | " + otherReportContext;
		} else {
			reportContent = selectedRadio;
		}
		vo.setReportContent(reportContent);
		vo.setReportType('c');
		
//		result = rService.submitCommentReport(vo);
		rService.reportComment(vo);
		return result;
	}
}


//게시글 블라인드 
//댓글 블라인드 
//회원 블락

