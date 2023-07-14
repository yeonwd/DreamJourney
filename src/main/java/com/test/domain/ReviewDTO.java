package com.test.domain;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private String activity_seq;		//액티비티 번호
	private String review_seq;		//리뷰번호
	private String content;			//리뷰내용
	private String score;				//평점
	private String pay_seq;			//결제번호
	private String thread;			//쓰레드
	private String depth;				//뎁스
	private String rdate;				//리뷰 작성 날짜
	private String nickname;		//닉네임
}
