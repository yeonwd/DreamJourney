package com.test.domain;

import lombok.Data;

@Data
public class UnwrittenReviewDTO {
	
	private String pay_seq;
	private String name;
	private String begindate;
	
	public void setBegindate(String begindate) {
		
		begindate = begindate.substring(0, 10);
	
		this.begindate = begindate;
	}

}
