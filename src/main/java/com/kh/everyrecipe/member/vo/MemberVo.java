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
public class MemberVo {
//	---------- -------- ------------------ 
//	TABLE "MEMBERS"
//			"USERID"	VARCHAR2(15 char)		NOT NULL,
//			"EMAIL"	VARCHAR2(50 char)		    NOT NULL,
//			"PASSWORD"	VARCHAR2(80 char)		NOT NULL,
//			"NICKNAME"	VARCHAR2(50 char)		NULL,
//			"PROFILE"	VARCHAR2(200 char)		NULL,
//			"PROFILEURL"	VARCHAR2(300 char)		NULL,
//			"CREATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
//			"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
//			"STATUS"	NUMBER(1)	DEFAULT 0	NOT NULL,
//			"AUTHORITY"	VARCHAR2(30)	DEFAULT 'ROLE_MEMBER' NOT NULL,
//			"POSTBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
//			"REPLYBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
//			"BLOCKSTARTDT"	VARCHAR2(8)	DEFAULT NULL	NULL,
//			"BLOCKENDDT"	VARCHAR2(8)	DEFAULT NULL	NULL
	
	private String userId;
	private String email;
	private String password;
	private String nickName;
	private String profile;
	private String profileUrl;
	private Date createAt;
	private Date updateAt;
	private int status;
	private String authority;
	private String isBlocked;

	

	
	
	
}
