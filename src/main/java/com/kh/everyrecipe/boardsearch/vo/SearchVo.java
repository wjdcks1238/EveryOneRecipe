package com.kh.everyrecipe.boardsearch.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchVo {
//	------ -------- ----------------- 
//	KEWORD NOT NULL VARCHAR2(30 CHAR) 
//	TIMES  NOT NULL NUMBER
	
	private int rowN;
	private String keword;
	private char isVisible;
	private int times;
	private Date searchDate;
}
