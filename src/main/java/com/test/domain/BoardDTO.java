package com.test.domain;

import lombok.Data;

@Data
public class BoardDTO {
	private String free_seq;
	private String title;
	private String content;
	private String category;
	private String fname;
	private String report;
	private String recommend;
	private String readcount;
	private String regdate;
	private String member_seq;
	private String ccount;
	
	// 회원 닉네임
	private String nickname;
	
	// 댓글
	private String freply_seq;
	private String freply_content;
	private String freply_regdate;

	// 세션 
	private String session_member_seq;
}
