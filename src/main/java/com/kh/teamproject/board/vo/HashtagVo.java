package com.kh.teamproject.board.vo;

import org.springframework.stereotype.Component;

@Component
public class HashtagVo {

	private int postId;
	private String hashtag;
	public HashtagVo(int postId, String hashtag) {
		super();
		this.postId = postId;
		this.hashtag = hashtag;
	}
	public HashtagVo() {}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	@Override
	public String toString() {
		return "HashtagVo [postId=" + postId + ", hashtag=" + hashtag + "]";
	}
	
	
}
