package com.kh.everyrecipe.board.vo;

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
public class BoardVo {

	private int postId;
	private String userId;
	private String nickname;	
	private String foodName;	
	private String content;
	private Date createDate;
	private Date UpdateDate;
	private String isDeleted; //논리삭제여부 'N'
	private int lookUp;		  //조회수
}
