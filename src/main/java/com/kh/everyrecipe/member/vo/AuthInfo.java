package com.kh.everyrecipe.member.vo;

import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Component
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class AuthInfo {
//	---------- -------- ------------------ 
//	TABLE "MEMBERS"
//			"USERID"	VARCHAR2(15 char)		NOT NULL,
//			"PASSWORD"	VARCHAR2(80 char)		NOT NULL,
// 회원 정보 세션을 유지해주는 기능을 하기위해 생성함. 보안을 위해 MemverVo와 분리
	private String userId;
	private String password;
	
	
}