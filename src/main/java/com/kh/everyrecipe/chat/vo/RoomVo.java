package com.kh.everyrecipe.chat.vo;

import lombok.Data;

@Data
public class RoomVo {
	private int key;
	private String title;
	private String isDeleted;
	private String userId;
	private String userName;
	private int cnt;	
}
