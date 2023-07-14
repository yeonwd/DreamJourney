package com.test.service;

import java.util.List;

import com.test.domain.ActivityDTO;
import com.test.domain.ReviewDTO;

//DAO 데이터를 주고 받으며 비즈니스 로직 수행
public interface ActivityService {

   List<ActivityDTO> activitylist();
   
   List<ActivityDTO> activitylist2();

   ActivityDTO get(String activity_seq);

   List<ReviewDTO> review(String activity_seq);

   ActivityDTO pay(ActivityDTO pdto);


   String reviewCount(String activity_seq);

   void addReview(ReviewDTO rdto);

   String paydate(ActivityDTO dto);

   void payok(ActivityDTO dto);

List<String> cal(String activity_seq);

String avgScore(String activity_seq);

void bookmark_on(ActivityDTO dto);

//RoomDTO rpay(RoomDTO rdto);





}