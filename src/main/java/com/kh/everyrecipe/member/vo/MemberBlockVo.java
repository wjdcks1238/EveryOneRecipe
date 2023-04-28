package com.kh.everyrecipe.member.vo;

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
public class MemberBlockVo {
//	--------- -------- ------------------ 
//	BLOCKID   NOT NULL NUMBER             
//	USERID    NOT NULL VARCHAR2(20 CHAR)  
//	REASON             VARCHAR2(200 CHAR) 
//	STARTTIME NOT NULL TIMESTAMP(6)       
//	ENDTIME   NOT NULL TIMESTAMP(6) 
	
	private int blockId;
	private String userId;
	private String Reason;
	private Date startTime;
	private Date endTime;

}
