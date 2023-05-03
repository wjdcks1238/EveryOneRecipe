package com.kh.everyrecipe.boardsearch.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchClientChkVo {
//	KEYWORD        NOT NULL VARCHAR2(30 CHAR)  
//	BROWSER        NOT NULL VARCHAR2(255 CHAR) 
//	IP             NOT NULL VARCHAR2(50 CHAR)  
//	LASTACCESSTIME NOT NULL DATE
	
	private String keyword;
	private String browser;
	private String ip;
	private Date lastAccessTime;
	private int times;
}
