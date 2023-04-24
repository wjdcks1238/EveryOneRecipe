package com.kh.everyrecipe.chat.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVo {
	private int messageNo;
	private String message;
	private Date createDate;
	private int key;
	private String userId;	
	private String userName;
	
}
