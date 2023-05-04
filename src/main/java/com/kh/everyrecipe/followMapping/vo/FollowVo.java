package com.kh.everyrecipe.followMapping.vo;


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
public class FollowVo {
	private String userId;	
	private String profileUrl;
	private String nickname;
	private int followerCnt;
}
