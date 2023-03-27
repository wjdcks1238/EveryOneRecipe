package com.kh.everyrecipe.followMapping.vo;

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
public class FollowMappingVo {
	private String fwId;
	private String userId;	
	private String ISDELETED;
}
