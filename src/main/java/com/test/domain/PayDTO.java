package com.test.domain;

import lombok.Data;

@Data
public class PayDTO {

	private String pay_seq; 
	private String treserve_seq;
	private String rreserve_seq;
	private String areserve_seq;
	private String regdate;
	private String paymethod;
	private String price;
	
}
