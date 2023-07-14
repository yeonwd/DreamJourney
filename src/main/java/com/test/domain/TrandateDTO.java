package com.test.domain;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TrandateDTO {

	private String trandate_seq;
	private String tran_seq;
	private String begin;
	private String sold;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tran_date;
}
