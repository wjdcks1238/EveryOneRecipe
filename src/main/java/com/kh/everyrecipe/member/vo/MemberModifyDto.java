package com.kh.everyrecipe.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Component
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class MemberModifyDto {
//	---------- -------- ------------------ 
//	TABLE "MEMBERS"
//			"USERID"	VARCHAR2(15 char)		NOT NULL,
//			"EMAIL"	VARCHAR2(50 char)		    NOT NULL,
//			"PASSWORD"	VARCHAR2(80 char)		NOT NULL,
	
	private String userId;
	private String email;
	private String password;
	private String newpassword;

	

	
	
	
}
