package com.test.domain;

import lombok.Data;

@Data
public class AccommodateDTO {
   
   private String acco_seq;
   private String tran_seq;
   private String type;
   private String name;
   private String address;
   private String note;
   private String acco_img;
   private String limit;
   private String tran_date;
   private String destination;
   private String departure;
   private String runtime;
   private String price;

   
   private String content;      //내용
   
   private String score;         //평점
   private String reviewContent;   //리뷰
   private String review_seq;   //리뷰번호
   private String nickname;   //닉네임
   private String rdate;         //리뷰 작성 날짜
   private String rcount;      //리뷰 개수
   
   private String totalPrice;      //총 가격
   private String totalPeople;   //총 인원
   private String dates;         //선택 날짜      
   
   private String member_seq;   //멤버 seq
   
   
}