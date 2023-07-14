package com.test.domain;

import lombok.Data;

@Data
public class MemberDTO {
	private String member_seq;
	private String name;
	private String email;
	private String pw;
	private String nickname;
	private String tel;
	
}
