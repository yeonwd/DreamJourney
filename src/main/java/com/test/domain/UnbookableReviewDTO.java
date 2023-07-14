package com.test.domain;

import lombok.Data;

@Data
public class UnbookableReviewDTO {
	
	private String freview_seq;
	private String content;
	private String score;
	private String thread;
	private String depth;
	private String rdate;
	
	private String name;

}
