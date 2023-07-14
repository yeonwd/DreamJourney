package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.domain.AccoReserveDTO;
import com.test.domain.ActivityReserveDTO;
import com.test.domain.BookableReviewDTO;
import com.test.domain.BookmarkDTO;
import com.test.domain.MemberDTO;
import com.test.domain.MyWriteDTO;
import com.test.domain.PayDTO;
import com.test.domain.ScheduleDTO;
import com.test.domain.TranReserveDTO;
import com.test.domain.TripDTO;
import com.test.domain.UnbookableReviewDTO;
import com.test.domain.UnwrittenReviewDTO;

public interface MypageService {

	// 즐겨찾기 목록
	List<BookmarkDTO> bookmarkList(String seq);

	List<TranReserveDTO> transList(String seq);

	List<AccoReserveDTO> accommodateList(String seq);

	List<ActivityReserveDTO> activityList(String seq);

	TranReserveDTO treservedetail(String pay_seq, String seq);

	AccoReserveDTO rreservedetail(String pay_seq, String seq);

	PayDTO rpay(String pay_seq);

	ActivityReserveDTO areservedetail(String pay_seq, String seq);


	MemberDTO getMemberInfo(String seq);

	void saveMemberInfo(MemberDTO dto);

	List<BookableReviewDTO> getAccommodateReview(String seq);

	List<BookableReviewDTO> getActivityReview(String seq);

	List<UnbookableReviewDTO> getFoodReview(String seq);

	int updatebr(String seq, String newContent);

	int schInsert(String nth, String string, String string2, String string3);

	int tripInsert(String title, String begin, String end, String seq);

	String getTripId();

	int dayInsert(String nth, String trip_seq);

	int updateubr(String seq, String newContent);

	String getDaySeq(String nth, String trip_seq);

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
