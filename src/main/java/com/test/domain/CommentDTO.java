package com.test.domain;

import lombok.Data;

@Data
public class CommentDTO {
	private String freply_seq;
	private String content;
	private String regdate;
	private String free_seq;
	private String member_seq;
	
	private String nickname;
	// 세션
	private String session_member_seq;
}
