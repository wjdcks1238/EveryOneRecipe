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
public class PostVo {
	private int postId;
	private String userId;
	private String nickname;	
	private String foodName;	
	private String content;
	private Date createDate;
	private Date UpdateDate;
	private String isDeleted;
	private String profileUrl;
	private String profile;
	private List<IngredientVo> ingredients;
	private int lookUp;
	private int likeCnt;
	private int followCnt;
	private int bookmarkCnt;
	private String hashtag;
	@Override
	public String toString() {
		return "PostVo [postId=" + postId + ", userId=" + userId + ", nickname=" + nickname + ", foodName=" + foodName
				+ ", content=" + content + ", createDate=" + createDate + ", UpdateDate=" + UpdateDate + ", isDeleted="
				+ isDeleted + ", profileUrl=" + profileUrl + ", profile=" + profile + ", ingredients=" + ingredients
				+ ", lookUp=" + lookUp + ", likeCnt=" + likeCnt + ", followCnt=" + followCnt + ", bookmarkCnt="
				+ bookmarkCnt + ", hashtag=" + hashtag + "]";
	}
	
	
}
