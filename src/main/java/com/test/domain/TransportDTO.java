package com.test.domain;

import lombok.Data;

@Data
public class TransportDTO {

	private String tran_seq;
	private String type;
	private String runtime;
	private String departure;
	private String destination;
	private String limit;
	private String price;
}
