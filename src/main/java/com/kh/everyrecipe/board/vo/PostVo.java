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
	private String isBlinded;
	private String mainImage;
	
	@Override
	public String toString() {
		return "PostVo [postId=" + postId + ", userId=" + userId + ", nickname=" + nickname + ", foodName=" + foodName
				+ ", createDate=" + createDate + ", UpdateDate=" + UpdateDate + ", isDeleted="
				+ isDeleted + ", profileUrl=" + profileUrl + ", profile=" + profile + ", ingredients=" + ingredients
				+ ", lookUp=" + lookUp + ", likeCnt=" + likeCnt + ", followCnt=" + followCnt + ", bookmarkCnt="
				+ bookmarkCnt + ", hashtag=" + hashtag +", isBlinded=" + isBlinded +", mainImage=" + mainImage+ "]";
	}
	@Override
	public int hashCode() {
		System.out.println("해시");
		final int prime = 31;
		int result = 1;
		result = prime * result + ((UpdateDate == null) ? 0 : UpdateDate.hashCode());
		result = prime * result + bookmarkCnt;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + followCnt;
		result = prime * result + ((foodName == null) ? 0 : foodName.hashCode());
		result = prime * result + ((hashtag == null) ? 0 : hashtag.hashCode());
		result = prime * result + ((ingredients == null) ? 0 : ingredients.hashCode());
		result = prime * result + ((isDeleted == null) ? 0 : isDeleted.hashCode());
		result = prime * result + likeCnt;
		result = prime * result + lookUp;
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + postId;
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((profileUrl == null) ? 0 : profileUrl.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		System.out.println(result);
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		System.out.println("값비교");
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostVo other = (PostVo) obj;

		if (postId != other.postId)
			return false;
		return true;
	}
	
	
}
