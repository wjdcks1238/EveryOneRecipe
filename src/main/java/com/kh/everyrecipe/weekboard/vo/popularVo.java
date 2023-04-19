package com.kh.everyrecipe.weekboard.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class popularVo {
	private int rownum;
	private String keword;
	private int times;
	
}
