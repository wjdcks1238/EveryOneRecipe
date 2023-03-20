package com.kh.everyrecipe.board.vo;

import java.sql.Date;
import java.util.List;

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
public class PostVo {
	private int postId;
	private String userId;
	private String nickname;	
	private String foodName;	
	private String content;
	private Date createDate;
	private Date UpdateDate;
	private String isDeleted;
	private List<IngredientVo> ingredients;
}
