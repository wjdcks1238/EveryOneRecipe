package com.kh.everyrecipe.weekboard.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class weekVo {
	private int postId;
	private String userId;
	private String nickname;	
	private String foodName;
	private int lookUp;
	private Date createAt;
	private Date updateAt;
	private String isDeleted; 
	private String dateWrite;
	
	public String getDateWrite() {
		long createDate = this.createAt.getTime(); //DB에서 가지고 온 시간
		long current_time = System.currentTimeMillis(); //현재시간
		long getTime = (current_time - createDate)/1000; 
		
		if(getTime < 60) {
			return "방금 전";
		} else if(getTime < 300) {
			return "5분 이내";
		} else if(getTime < 3600) {
			return "1시간 이내";
		} else if(getTime < 10800) {
			return "3시간 이내";
		} else if(getTime < 43200) {
			return "12시간 이내";
		} else if(getTime < 86400) {
			return "24시간 이내";
		} else {
			this.dateWrite = new SimpleDateFormat("YYYY-MM-dd").format(createDate);
			return dateWrite;
		}	
	}	
	public void setDateWrite(String dateWrite) {
		this.dateWrite = dateWrite;
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
	
	public int getLookUp() {
		return lookUp;
	}

	public void setLookUp(int lookUp) {
		this.lookUp = lookUp;
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
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
}
