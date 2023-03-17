package com.kh.teamproject.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamproject.board.service.BoardService;
import com.kh.teamproject.board.vo.BoardVo;
import com.kh.teamproject.board.vo.IngredientVo;
import com.kh.teamproject.fileutil.FileUtil;
import com.kh.teamproject.member.vo.MemberVo;

@Controller
@RequestMapping("/board")
public class BoardController {
		@Autowired
		private BoardService service;
	
//		@GetMapping("/list")
//		public void list() {
//			System.out.println("list~!~!~!~!~!!~");
//		}
		
		@GetMapping("/list")
		public ModelAndView list2(ModelAndView mv
				) {
				
			
			try {
				//TODO isdelete 필드가 'N'인 게시글만 불러온다. 				
				mv.addObject("postList", service.selectList());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/list");
			return mv;
		}
}
