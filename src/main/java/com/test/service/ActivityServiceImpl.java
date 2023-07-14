package com.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.domain.ActivityDTO;
import com.test.domain.ReviewDTO;
import com.test.mapper.ActivityMapper;

@Service
public class ActivityServiceImpl implements ActivityService {
   
   @Autowired
   private ActivityMapper mapper;
   
   //액티비티 전체 목록
   @Override
   public List<ActivityDTO> activitylist() {
      return mapper.activitylist();
   }
   
   //액티비티 전체 목록2
   @Override
   public List<ActivityDTO> activitylist2() {
      return mapper.activitylist2();
   }
   
   
   //상세보기
   @Override
   public ActivityDTO get(String activity_seq) {
      return mapper.get(activity_seq);
   }
   
   //리뷰 출력
   @Override
   public List<ReviewDTO> review(String activity_seq) {
      return mapper.review(activity_seq);
   }
   
   //리뷰 작성
   @Override
   public void addReview(ReviewDTO rdto) {
      mapper.addReview(rdto);
      System.out.println(rdto);
   }

   //결제 
   @Override
   public ActivityDTO pay(ActivityDTO pdto) {
      return mapper.pay(pdto);
   }
   
   
   //즐겨찾기 추가
   @Override
	public void bookmark_on(ActivityDTO dto) {
	   mapper.bookmark_on(dto);
	}
   
   //댓글 개수
   @Override
   public String reviewCount(String activity_seq) {
      // TODO Auto-generated method stub
      return mapper.reviewCount(activity_seq);
   }
   
   //결제 날짜(adate_seq 찾기)
   @Override
   public String paydate(ActivityDTO dto) {
      return mapper.paydate(dto);
   }
   
   //결제 성공
   @Override
   public void payok(ActivityDTO dto) {
      mapper.payok(dto);
   }
   
   @Override
	public List<String> cal(String activity_seq) {
		return mapper.cal(activity_seq);
	}
   
   @Override
	public String avgScore(String activity_seq) {

	   return mapper.avgScore(activity_seq);
	}
   
//   @Override
//   public RoomDTO rpay(RoomDTO rdto) {
//
//      return mapper.rpay(rdto);
//   }
   
}