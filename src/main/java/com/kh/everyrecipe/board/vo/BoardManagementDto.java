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
public class BoardManagementDto {

	private String userId;
	private String nickname;
	private Date createAt; 
	private String postBlockYn;
	private String replyBlockYn;
	private String blockStartDt;
	private String blockEndDt;
	//게시물 테이블에 추가된 컬럼
	private int postedCnt;
	private int postReportedCnt;
	private int replyCnt;
	private int replyReportedCnt;

}
