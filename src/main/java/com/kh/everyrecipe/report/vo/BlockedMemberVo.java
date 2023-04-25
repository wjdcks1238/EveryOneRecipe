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
public class BlockedMemberVo {

	private int blockId;
	private String userId;
	private String status;
	private String startTime;
	private String endTime;
	private String reason;
	private int blockCnt;
	
	
}
