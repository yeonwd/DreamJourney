package com.test.mapper;

import java.util.List;  
import java.util.Map;

import com.test.domain.AccoReserveDTO;
import com.test.domain.ActivityReserveDTO;
import com.test.domain.BookmarkDTO;
import com.test.domain.PayDTO;
import com.test.domain.ScheduleDTO;
import com.test.domain.TranReserveDTO;
import com.test.domain.TripDTO;
import com.test.domain.BookableReviewDTO;
import com.test.domain.MemberDTO;
import com.test.domain.MyWriteDTO;
import com.test.domain.UnbookableReviewDTO;
import com.test.domain.UnwrittenReviewDTO;

public interface MypageMapper {

	List<BookmarkDTO> bookmarkList(String seq);

	List<TranReserveDTO> transList(String seq);

	List<AccoReserveDTO> accommodateList(String seq);

	List<ActivityReserveDTO> activityList(String seq);

	TranReserveDTO treservedetail(Map<String, String> map);

	AccoReserveDTO rreservedetail(Map<String, String> map);

	PayDTO rpay(String rreserve_seq);

	ActivityReserveDTO areservedetail(Map<String, String> map);

	MemberDTO getMemberInfo(String seq);

	void saveMemberInfo(MemberDTO dto);

	List<BookableReviewDTO> getAccommodateReview(String seq);

	List<BookableReviewDTO> getActivityReview(String seq);

	List<UnbookableReviewDTO> getFoodReview(String seq);

	int updateBookableReview(Map<String, String> map);
	
	int updateUnbookableReview(Map<String, String> map);

	int schInsert(Map<String, String> map);

	int tripInsert(Map<String, String> map);

	String getTripId();

	int dayInsert();

	int dayInsert(Map<String, String> map);

	String getDaySeq(Map<String, String> map);

	int payDel(String pay_seq);
	
	int deletebr(String seq);

	int deleteubr(String seq);

	int setReviewStatus(String seq);

	List<UnwrittenReviewDTO> getUnwrittenAccommodate(String seq);

	List<TripDTO> getTrip(String seq);

	void journeyshar(String trip_seq);
	List<UnwrittenReviewDTO> getUnwrittenActivity(String seq);

	int writereview(Map<String, String> map);

	int updatestatus(String seq);

	int[] getDay_seq(String trip_seq);

	void scheduledel(int day_seq);

	void daydel(String trip_seq);

	void journeydel(String trip_seq);

	TripDTO gettripview(String trip_seq);

	String getDayButtons(String seq);

	List<ScheduleDTO> getSchedule(Map<String, String> map);

	List<TripDTO> tripList();

	int plusrecommend(String seq);

	List<MyWriteDTO> getmywrite(String seq);

	void unregi(String member_seq);
	List<TripDTO> getTripAll();


}
