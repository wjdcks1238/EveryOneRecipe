package com.kh.teamproject.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardVo {

	private int postId;
	private String userId;
	private String nickname;	
	private String foodName;	
	private String content;
	private Date createDate;
	private Date UpdateDate;
	private String isDeleted;
	
	public BoardVo() {} 
	public BoardVo(int postId, String userId, String nickname, String foodName, String content, Date createDate,
			Date updateDate, String isDeleted) {
		super();
		this.postId = postId;
		this.userId = userId;
		this.nickname = nickname;
		this.foodName = foodName;
		this.content = content;
		this.createDate = createDate;
		UpdateDate = updateDate;
		this.isDeleted = isDeleted;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return UpdateDate;
	}
	public void setUpdateDate(Date updateDate) {
		UpdateDate = updateDate;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	@Override
	public String toString() {
		return "BoardVo [postId=" + postId + ", userId=" + userId + ", nickname=" + nickname + ", foodName=" + foodName
				+ ", content=" + content + ", createDate=" + createDate + ", UpdateDate=" + UpdateDate + ", isDeleted="
				+ isDeleted + "]";
	}
	

	
	

}
