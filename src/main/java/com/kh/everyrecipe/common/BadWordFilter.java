package com.kh.everyrecipe.common;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class BadWordFilter {
	private List<String> badWords = Arrays.asList("욕설1", "욕설2", "욕설3");

	public boolean containsBadWord(String content) {
		for (String word : badWords) {
			if (content.contains(word)) {
				return true;
			}
		}
		return false;
	}
}
