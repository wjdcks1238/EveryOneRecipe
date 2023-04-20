package com.kh.everyrecipe.board.vo;



import java.sql.Date;

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
public class ClientChkVo {
	private int postId;
	private String ip;
	private String browser;	
	private Date lastAccessTime; 
	private int lookUp;
}
