package com.kh.everyrecipe.comment.replycomment.vo;

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
public class ReplyCommentVo {
//	--------- -------- ------------------ 
//	RCMID     NOT NULL NUMBER             
//	CMTID     NOT NULL NUMBER             
//	CONTENT   NOT NULL VARCHAR2(200 CHAR) 
//	UPDATEAT  NOT NULL TIMESTAMP(6)       
//	ISDELETED NOT NULL VARCHAR2(1 CHAR)
	int rcmId;
	int cmtId;
	String content;
	Date updateAt;
	char isDeleted;
}
