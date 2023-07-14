package com.test.domain;

import lombok.Data;

@Data
public class BookableReviewDTO {
	
	private String review_seq;
	private String content;
	private String score;
	private int thread;
	private int depth;
	private String pay_seq;
	private String rreserve_seq;
	private String areserve_seq;
	private String rdate;
	
	private String name;

}
