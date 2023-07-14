package com.test.domain;

import lombok.Data;

@Data
public class RoomDTO {

	private String room_seq;
	private String acco_seq;
	private String name;
	private String limit;
	private String price;
	private String note;
	private String room_img;
	
	private String totalPrice;		//총 가격
	private String totalPeople;	//총 인원
	private String dates;			//선택 날짜	
	
	
}
