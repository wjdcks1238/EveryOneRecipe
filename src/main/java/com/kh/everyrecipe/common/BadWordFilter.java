package com.kh.everyrecipe.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.everyrecipe.board.service.BoardService;

@Component
public class BadWordFilter {
	
	@Autowired
	private BoardService bService;
	
	public boolean containsBadWord(String content) throws Exception {
		
		
		List<String> badwords= bService.getAllBadwords();
		
		for (String word : badwords) {
			if (content.contains(word)) {
				return true;
			}
		}
		return false;
	}
}
