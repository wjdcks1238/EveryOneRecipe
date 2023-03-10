package com.kh.teamproject.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {
//	------------ -------- -------------- 
//	USERNUM      NOT NULL NUMBER         
//	USERID       NOT NULL VARCHAR2(20)   
//	USERNAME              VARCHAR2(20)   
//	USERNICKNAME          VARCHAR2(45)   
//	EMAIL                 VARCHAR2(100)  
//	PASSWORD              VARCHAR2(30)   
//	CREATE_AT             DATE           
//	ADDRESS               VARCHAR2(1000)
	
	private int userNum;
	private String userId;
	private String userName;
	private String userNickName;
	private String email;
	private String password;
	private Date createAt;
	private String address;
	
	public MemberVo() {
		super();
	}
	
	public MemberVo(int userNum, String userId, String userName, String userNickName
			, String email, String password, Date createAt, String address) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userName = userName;
		this.userNickName = userNickName;
		this.email = email;
		this.password = password;
		this.createAt = createAt;
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "MemberVo [userNum=" + userNum + ", userId=" + userId + ", userName=" + userName + ", userNickName="
				+ userNickName + ", email=" + email + ", password=" + password + ", createAt=" + createAt + ", address="
				+ address + "]";
	}
	
	public int getUserNum() {
		return userNum;
	}
	
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserNickName() {
		return userNickName;
	}
	
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
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
	
	public Date getCreateAt() {
		return createAt;
	}
	
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}
