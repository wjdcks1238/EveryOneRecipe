package com.kh.everyrecipe.comment.vo;

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
public class CommentVo {
//	--------- -------- ------------------ 
//	CMTID     NOT NULL NUMBER             
//	USERID    NOT NULL VARCHAR2(20 CHAR)  
//	POSTID    NOT NULL NUMBER             
//	CONTENT   NOT NULL VARCHAR2(200 CHAR) 
//	UPDATEAT  NOT NULL TIMESTAMP(6)       
//	ISDELETED NOT NULL VARCHAR2(1 CHAR)
	
	private int cmtId;
	private String userId;
	private int postId;
	private String content;
	private Date updateAt;
	private char isDeleted;
}
