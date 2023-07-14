package com.test.domain;

import lombok.Data;

@Data
public class TranReserveDTO {

	private String treserve_seq;
	private String type;
	private String runtime;
	private String departure;
	private String destination;
	private String price;
	private String tran_date;
	private String begin;
	private String regdate;
	private String trandate_seq;
	
	private String pay_seq;
	
}
