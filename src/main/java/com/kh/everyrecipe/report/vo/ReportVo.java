package com.kh.everyrecipe.report.vo;

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
public class ReportVo {
//	------------- -------- ------------------ 
//	REPORTID      NOT NULL NUMBER             
//	USERID        NOT NULL VARCHAR2(15 CHAR)  
//	POSTID                 NUMBER             
//	CMTID                  NUMBER             
//	REPORTCONTENT NOT NULL VARCHAR2(100 CHAR) 
//	REPORTTYPE    NOT NULL VARCHAR2(1 CHAR)   
//	REPORTTIME    NOT NULL TIMESTAMP(6)
	
	private int reportId;
	private String userId;
	private int postId;
	private int cmtId;
	private String reportContent;
	private char reportType;
	private Date reportTime;
}
