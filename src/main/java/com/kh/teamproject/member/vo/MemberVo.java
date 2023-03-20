package com.kh.teamproject.member.vo;

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
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVo {
//	---------- -------- ------------------ 
//	USERID     NOT NULL VARCHAR2(15 CHAR)  
//	EMAIL      NOT NULL VARCHAR2(50 CHAR)  
//	PASSWORD   NOT NULL VARCHAR2(200 CHAR) 
//	NICKNAME   NOT NULL VARCHAR2(50 CHAR)  
//	PROFILE             VARCHAR2(200 CHAR) 
//	PROFILEURL          VARCHAR2(300 CHAR) 
//	CREATEAT   NOT NULL TIMESTAMP(6)       
//	UPDATEAT            TIMESTAMP(6)       
//	ISDELETED  NOT NULL VARCHAR2(1 CHAR)   
//	ISOPERATOR NOT NULL VARCHAR2(1 CHAR)
	
	private String userId;
	private String email;
	private String password;
	private String nickName;
	private String profile;
	private String profileUrl;
	private Date createAt;
	private Date updateAt;
	private char isDeleted;
	private char isOperator;
}
