package com.kh.everyrecipe.postBookmark.vo;

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
public class PostBookmarkVo {
	private int postId;
	private String userId;	
	private String isDeleted;
	private Date addDate;
}
