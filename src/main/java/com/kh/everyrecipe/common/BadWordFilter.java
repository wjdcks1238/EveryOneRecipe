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

import org.springframework.stereotype.Component;

@Component
public class BadWordFilter {
	
	HttpServletRequest request;
	
	//private List<String> badWords = Arrays.asList("욕설1", "욕설2", "욕설3");
	InputStream inputStream = getClass().getClassLoader().getResourceAsStream("badwordList.txt");
	BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

	private Set<String> badwords = new LinkedHashSet<String>();
	
	public boolean containsBadWord(String content) {
		
		try {
			String line;
			while ((line = reader.readLine()) != null) {
				badwords.add(line);
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		for (String word : badwords) {
			if (content.contains(word)) {
				return true;
			}
		}
		return false;
	}
}
