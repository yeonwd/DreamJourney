package com.test.domain;

import lombok.Data;

@Data
public class ActivityDTO {
	
	private String activity_seq;	//액티비티 번호
	private String title;			//제목
	private String content;		//내용
	private String address;		//주소
	private String limit;			//정원
	private String price;			//가격
	private String category;		//카테고리
	private String adate_seq;	//액티비티 날짜 번호
	private String adate;			//액티비티 날짜
	private String sold;			//판매량
	private String thumbnail;	//썸네일
	private String image1;		//이미지
	private String image2;		//이미지
	private String image3;		//이미지
	
	private String score;			//평점
	private String reviewContent;	//리뷰
	private String review_seq;	//리뷰번호
	private String nickname;	//닉네임
	private String rdate;			//리뷰 작성 날짜
	private String rcount;		//리뷰 개수
	private String avgScore;		//평점 평균
	
	private String totalPrice;		//총 가격
	private String totalPeople;	//총 인원
	private String dates;			//선택 날짜		
	private String paymethod;	//결제 수단
	
	private String member_seq;	//멤버 seq

}
