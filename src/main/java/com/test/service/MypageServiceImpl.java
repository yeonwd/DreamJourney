package com.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.test.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public List<BookmarkDTO> bookmarkList(String seq) {

		
		return mapper.bookmarkList(seq);
	}

	@Override
	public MemberDTO getMemberInfo(String seq) {
		return mapper.getMemberInfo(seq);
	}

	@Override
	public void saveMemberInfo(MemberDTO dto) {
		mapper.saveMemberInfo(dto);
	}

	@Override
	public List<BookableReviewDTO> getAccommodateReview(String seq) {
		return mapper.getAccommodateReview(seq);
	}

	@Override
	public List<BookableReviewDTO> getActivityReview(String seq) {
		return mapper.getActivityReview(seq);
	}

	@Override
	public List<UnbookableReviewDTO> getFoodReview(String seq) {
		return mapper.getFoodReview(seq);
	}

	@Override
	public int updatebr(String seq, String newContent) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("seq", seq);
		map.put("newContent", newContent);
		
		return mapper.updateBookableReview(map);
	}
	
	@Override
	public int updateubr(String seq, String newContent) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("seq", seq);
		map.put("newContent", newContent);
		
		return mapper.updateUnbookableReview(map);
		
	}
	
	@Override
	public List<TranReserveDTO> transList(String seq) {

		return mapper.transList(seq);
	}
	
	@Override
	public List<AccoReserveDTO> accommodateList(String seq) {

		return mapper.accommodateList(seq);
	}
	
	@Override
	public List<ActivityReserveDTO> activityList(String seq) {

		return mapper.activityList(seq);
	}
	
	@Override
	public TranReserveDTO treservedetail(String pay_seq, String seq) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("pay_seq", pay_seq);
		map.put("member_seq", seq);
		
		return mapper.treservedetail(map);
	}
	
	
	@Override
	public AccoReserveDTO rreservedetail(String pay_seq, String seq) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("pay_seq", pay_seq);
		map.put("member_seq", seq);
		
		return mapper.rreservedetail(map);
	}
	
	@Override
	public PayDTO rpay(String pay_seq) {

		return mapper.rpay(pay_seq);
	}
	
	@Override
	public ActivityReserveDTO areservedetail(String pay_seq, String seq) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("pay_seq", pay_seq);
		map.put("member_seq", seq);
		
		return mapper.areservedetail(map);
	}
	
	@Override
	public int payDel(String pay_seq) {

		return mapper.payDel(pay_seq);
	}
	
	@Override
	public int schInsert(String nth, String memo, String place, String address) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("nth", nth);
		map.put("memo", memo);
		map.put("place", place);
		map.put("address", address);
		
		return mapper.schInsert(map);
	}
	
	@Override
	public int tripInsert(String title, String begin, String end, String seq) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("title", title);
		map.put("begin", begin);
		map.put("end", end);
		map.put("member_seq", seq);
		
		
		return mapper.tripInsert(map);
	}
	
	@Override
	public String getTripId() {

		return mapper.getTripId();
	}
	
	@Override
	public int dayInsert(String nth, String trip_seq) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("nth", nth);
		map.put("trip_seq", trip_seq);
		
		return mapper.dayInsert(map);
	}

	@Override
	public int deletebr(String seq) {
		return mapper.deletebr(seq);
	}

	@Override
	public int deleteubr(String seq) {
		return mapper.deleteubr(seq);
	}

	@Override
	public int setReviewStatus(String seq) {
		return mapper.setReviewStatus(seq);
	}

	@Override
	public List<UnwrittenReviewDTO> getUnwrittenAccommodate(String seq) {
		return mapper.getUnwrittenAccommodate(seq);
	}
	
	@Override
	public String getDaySeq(String nth, String trip_seq) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("nth", nth);
		map.put("trip_seq", trip_seq);
		
		return mapper.getDaySeq(map);
	}

	@Override
	public List<UnwrittenReviewDTO> getUnwrittenActivity(String seq) {
		return mapper.getUnwrittenActivity(seq);
	}

	@Override
	public int writereview(Map<String, String> map) {
		return mapper.writereview(map);
	}

	@Override
	public int updatestatus(String seq) {
		return mapper.updatestatus(seq);
	}
	
	@Override
	public List<TripDTO> getTrip(String seq) {

		return mapper.getTrip(seq);
	}
	
	//후기전체보기
	@Override
	public List<TripDTO> getTripAll() {
		return mapper.getTripAll();
	}
	
	@Override
	public void journeyshar(String trip_seq) {

		mapper.journeyshar(trip_seq);
		
	}

	@Override
	public TripDTO gettripview(String trip_seq) {
		return mapper.gettripview(trip_seq);
	}

	@Override
	public String getDayButtons(String seq) {
		return mapper.getDayButtons(seq);
	}

	@Override
	public List<ScheduleDTO> getSchedule(Map<String, String> map) {
		return mapper.getSchedule(map);
	}

	
	@Override
	public int[] getDay_seq(String trip_seq) {

		return mapper.getDay_seq(trip_seq);
	}
	
	@Override
	public void scheduledel(int day_seq) {
		mapper.scheduledel(day_seq);
	}
	
	@Override
	public void journeydel(String trip_seq) {
		mapper.journeydel(trip_seq);
	}
	
	@Override
	public void daydel(String trip_seq) {
		mapper.daydel(trip_seq);
	}
	
	@Override
	public List<TripDTO> tripList() {

		return mapper.tripList();
	}

	@Override
	public int plusrecommend(String seq) {
		return mapper.plusrecommend(seq);
	}

	@Override
	public List<MyWriteDTO> getmywrite(String seq) {
		return mapper.getmywrite(seq);
	}
	
	@Override
	public void unregi(String member_seq) {
		mapper.unregi(member_seq);
	}
	
	
}
