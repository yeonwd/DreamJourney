package com.test.domain;

import lombok.Data;

@Data
public class TripDTO {

	private String trip_seq; 
	private String member_seq;
	private String title;
	private String content;
	private String recommend;
	private String regdate;
	private String begin;
	private String end;
	private String is_shared;
	
	private String rownum;
	private String name;
	private String nickname;
	
}
