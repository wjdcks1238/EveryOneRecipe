package com.kh.everyrecipe.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Component
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVo {
//	---------- -------- ------------------ 
//	TABLE "MEMBERS"
//			"USERID"	VARCHAR2(15 char)		NOT NULL,
//			"EMAIL"	VARCHAR2(50 char)		    NOT NULL,
//			"PASSWORD"	VARCHAR2(80 char)		NOT NULL,
//			"NICKNAME"	VARCHAR2(50 char)		NULL,
//			"PROFILE"	VARCHAR2(200 char)		NULL,
//			"PROFILEURL"	VARCHAR2(300 char)		NULL,
//			"CREATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
//			"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
//			"STATUS"	NUMBER(1)	DEFAULT 0	NOT NULL,
//			"AUTHORITY"	VARCHAR2(30)	DEFAULT 'ROLE_MEMBER' NOT NULL,
//			"POSTBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
//			"REPLYBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
//			"BLOCKSTARTDT"	VARCHAR2(8)	DEFAULT NULL	NULL,
//			"BLOCKENDDT"	VARCHAR2(8)	DEFAULT NULL	NULL
	
	private String userId;
	private String email;
	private String password;
	private String nickName;
	private String profile;
	private String profileUrl;
	private Date createAt;
	private Date updateAt;
	private int status;
	private String authority;
	private String postBlockYn;
	private String replyBlockYn;
	private String blockStartDt;
	private String blockEndDt;
	
	
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getPostBlockYn() {
		return postBlockYn;
	}
	public void setPostBlockYn(String postBlockYn) {
		this.postBlockYn = postBlockYn;
	}
	public String getReplyBlockYn() {
		return replyBlockYn;
	}
	public void setReplyBlockYn(String replyBlockYn) {
		this.replyBlockYn = replyBlockYn;
	}
	public String getBlockStartDt() {
		return blockStartDt;
	}
	public void setBlockStartDt(String blockStartDt) {
		this.blockStartDt = blockStartDt;
	}
	public String getBlockEndDt() {
		return blockEndDt;
	}
	public void setBlockEndDt(String blockEndDt) {
		this.blockEndDt = blockEndDt;
	}
	
	
	
	
}
