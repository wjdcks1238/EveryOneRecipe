package com.kh.everyrecipe.board.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RecommendVo {
	private int postId;
	private int cnt;
	private int ingcnt;
	private String foodName;
}
