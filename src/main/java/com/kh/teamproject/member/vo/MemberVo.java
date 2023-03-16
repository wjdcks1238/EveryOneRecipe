package com.kh.teamproject.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;


@Component
public class MemberVo {
//	---------- -------- ------------------ 
//	USERID     NOT NULL VARCHAR2(15 CHAR)  
//	EMAIL      NOT NULL VARCHAR2(50 CHAR)  
//	PASSWORD   NOT NULL VARCHAR2(200 CHAR) 
//	NICKNAME   NOT NULL VARCHAR2(50 CHAR)  
//	PROFILE             VARCHAR2(200 CHAR) 
//	PROFILEURL          VARCHAR2(300 CHAR) 
//	CREATEAT   NOT NULL TIMESTAMP(6)       
//	UPDATEAT            TIMESTAMP(6)       
//	ISDELETED  NOT NULL VARCHAR2(1 CHAR)   
//	ISOPERATOR NOT NULL VARCHAR2(1 CHAR)
	
	private String userId;
	private String email;
	private String password;
	private String nickName;
	private String profile;
	private String profileUrl;
	private Date createAt;
	private Date updateAt;
	private char isDeleted;
	private char isOperator;
	
	public MemberVo() {
		super();
	}
	
	public MemberVo(String userId, String email, String password, String nickName
			, String profile, String profileUrl, Date createAt, Date updateAt, char isDeleted
			, char isOperator) {
		super();
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.nickName = nickName;
		this.profile = profile;
		this.profileUrl = profileUrl;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.isDeleted = isDeleted;
		this.isOperator = isOperator;
	}

	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", email=" + email + ", password=" + password + ", nickName=" + nickName
				+ ", profile=" + profile + ", profileUrl=" + profileUrl + ", createAt=" + createAt + ", updateAt="
				+ updateAt + ", isDeleted=" + isDeleted + ", isOperator=" + isOperator + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getProfileUrl() {
		return profileUrl;
	}

	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	public char getIsOperator() {
		return isOperator;
	}

	public void setIsOperator(char isOperator) {
		this.isOperator = isOperator;
	}
	
	
	
}
