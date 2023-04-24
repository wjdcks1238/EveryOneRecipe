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
public class ReportedCmtVoAll {	
	private int reportId;
	private int cmtId;
	private int postId;
	private String cUserId;
	private String nickName;
	private String rUserId;
	private String reportContent;
	private String status;
	private Date reportTime;
}
