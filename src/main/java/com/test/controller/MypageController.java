package com.test.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.domain.BookableReviewDTO;
import com.test.domain.MemberDTO;
import com.test.domain.ScheduleDTO;
import com.test.domain.TripDTO;
import com.test.domain.UnbookableReviewDTO;
import com.test.domain.UnwrittenReviewDTO;
import com.test.service.MypageService;


@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	

	@GetMapping("/mypage")
	private String mypage() {
		return "mypage/mypage";
	}
	
	

	// 회원정보
	@GetMapping("/mypage/info")
	private String info(Model model, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		model.addAttribute("dto", service.getMemberInfo(seq));

		return "mypage/info";
	}

	// 회원정보 수정
	@GetMapping("/mypage/editinfo")
	private String editinfo(Model model, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		MemberDTO dto = service.getMemberInfo(seq);
		model.addAttribute("dto", dto);

		return "mypage/editinfo";
	}

	// 수정 완료
	@PostMapping("/mypage/saveinfo")
	private String saveinfo(MemberDTO dto, HttpSession session) {
		service.saveMemberInfo(dto);
		return "redirect:/mypage/info";
	}

	// 내 여행
	@GetMapping("/mypage/journey")
	private String journey(Model model, HttpSession session) {
		
		String seq = (String) session.getAttribute("seq");
		
		//세션 아이디 받아서 넘겨줘야함
		model.addAttribute("list", service.getTrip(seq));
		
		return "mypage/journey";
	}
	
	@PostMapping("/mypage/journeydel")
	private String journeydel(String trip_seq) {
		
		int[] day_seq = service.getDay_seq(trip_seq);
		
		
		for (int i=0; i<=day_seq.length; i++) {
			service.scheduledel(day_seq[i]);
		}
		
		service.daydel(trip_seq);
		
		service.journeydel(trip_seq);
		
		return "redirect:/mypage/journey";
		
	}
	
	@PostMapping("/mypage/journeyshar")
	private String journeyshar(String trip_seq) {
		
		service.journeyshar(trip_seq);
		
		return "redirect:/mypage/journey";
		
	}
	
	

	// 내 여행 등록
	@GetMapping("/mypage/addjourney")
	private String addjourney() {
		return "mypage/addjourney";
	}
	
	// 내 여행 등록
	@PostMapping("/mypage/addjourneyok")	
	private String addjourneyok(Model model,
								String title,
								String[] nthValues,
								String[] placeInputValues,
	                            String[] memoInputValues,
	                            String startdate,
	                            String enddate,
	                            HttpSession session) {
		
		String seq = (String) session.getAttribute("seq");
		
		String[] place = new String[placeInputValues.length];
	    String[] address = new String[placeInputValues.length];
	    String[] memo = new String[memoInputValues.length];
	    String[] nth = new String[memoInputValues.length];
	    
	    String begin = "";
	    String end = "";
	    
	    SimpleDateFormat inputFormat = new SimpleDateFormat("E MMM dd yyyy HH:mm:ss 'GMT'Z", Locale.ENGLISH);
	    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

	    try {
	        // 문자열을 Date 객체로 변환합니다.
	        Date beginDate = inputFormat.parse(startdate);
	        Date endDate = inputFormat.parse(enddate);

	        // Date 객체를 원하는 형식의 문자열로 변환합니다.
	        begin = outputFormat.format(beginDate);
	        end = outputFormat.format(endDate);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
        
        int maxNth = Integer.MIN_VALUE;
        
        for (int i = 0; i < nthValues.length; i++) {
            String numberNth = nthValues[i].substring(nthValues[i].length() - 1);
            int numberNthValue = Integer.parseInt(numberNth);

            if (numberNthValue > maxNth) {
            	maxNth = numberNthValue;
            }
        }
        
	    int tripResult = service.tripInsert(title, begin, end, seq);
	    
	    String trip_seq = service.getTripId();
	    
	    for (int i=1; i<=maxNth; i++) {
	    	String strI = String.valueOf(i);
	    	int dayResult = service.dayInsert(strI, trip_seq);
	    }
	    
		
	    for (int i = 0; i < placeInputValues.length; i++) {
	        String[] parts = placeInputValues[i].split("_");  // 쉼표로 분리
	        String[] dParts = memoInputValues[i].split("_");
	        
	        
	        if (parts.length >= 2) {
	            place[i] = parts[0].trim();  // place 배열에 저장
	            address[i] = parts[1].trim();  // placeAddress 배열에 저장
	            
	        } else {
	            // 배열에 저장할 요소가 충분하지 않은 경우 처리
	            place[i] = placeInputValues[i];
	            address[i] = "";  // 빈 문자열로 저장하거나 다른 방식으로 처리할 수 있습니다.
	        }
	        
	        if (dParts.length >= 2) {
	            memo[i] = dParts[0].trim();  // place 배열에 저장
	            nth[i] = dParts[1].substring(dParts[1].length() - 1);  // placeAddress 배열에 저장
	        } else {
	            // 배열에 저장할 요소가 충분하지 않은 경우 처리
	            memo[i] = placeInputValues[i];
	            nth[i] = "";  // 빈 문자열로 저장하거나 다른 방식으로 처리할 수 있습니다.
	        }

	        String day_seq = service.getDaySeq(nth[i], trip_seq); 
	        
	        
	        int schResult = service.schInsert(day_seq, memo[i], place[i], address[i]);
	        
	    }
		
	    return "redirect:/mypage/journey";
	}

	// 내 여행 상세보기
	@GetMapping("/mypage/viewjourney")
	private String viewjourney(String trip_seq, Model model) {
		
		TripDTO dto = service.gettripview(trip_seq);
		
		String begin = dto.getBegin().substring(0, 10);
		String end = dto.getEnd().substring(0, 10);
		String regdate = dto.getRegdate().substring(0, 10);
		
		dto.setBegin(begin);
		dto.setEnd(end);
		dto.setRegdate(regdate);
		
		
		model.addAttribute("dto", dto);
		
		return "mypage/viewjourney";
	}
	
	// 여행 일수 계산
	@ResponseBody
	@GetMapping("/mypage/getdaybuttons")
	private String getdaybuttons(String seq) {
		return service.getDayButtons(seq);
	}
	
	// 일정 출력
	@ResponseBody
	@RequestMapping(value="/mypage/getschedule", produces="application/json;charset=UTF-8")
	private String getschedule(String seq, String day) {
		
		Map <String, String> map = new HashMap<String, String>();
		
		map.put("seq", seq);
		map.put("day", day);
		
		List <ScheduleDTO> list = service.getSchedule(map);
		ObjectMapper mapper = new ObjectMapper();
		String jsonResponse;
		
		System.out.println(list);
		
		try {
			jsonResponse = mapper.writeValueAsString(list);
			return jsonResponse;
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// 내 리뷰
	@GetMapping("/mypage/review")
	private String review() {

		return "mypage/review";
	}
	
	// 미작성 리뷰 조회
	@ResponseBody
	@RequestMapping(value="/mypage/unwrittenreview", produces="application/json;charset=UTF-8")
	private String unwrittenreview(String selected, HttpSession session) {
		
		String seq = (String) session.getAttribute("seq");
		
		List <UnwrittenReviewDTO> list = new ArrayList <UnwrittenReviewDTO>();
		
		if(selected.equals("accommodate")) list = service.getUnwrittenAccommodate(seq);
		else if(selected.equals("activity")) list = service.getUnwrittenActivity(seq);
				
		ObjectMapper mapper = new ObjectMapper();
		String jsonResponse;
		
		try {
			jsonResponse = mapper.writeValueAsString(list);
			return jsonResponse;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 리뷰 작성
	@ResponseBody
	@RequestMapping(value="/mypage/writereview", produces="application/json;charset=UTF-8", method = RequestMethod.POST)
	private void writereview(String seq, String content, String score) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("seq", seq); //pay_seq
		map.put("content", content);
		map.put("score", score);

		int result = -1;
		result = service.updatestatus(seq);
		result = service.writereview(map);
		
		System.out.println("리뷰 작성 결과: " + result);
		
	}

	// 내 리뷰 조회 ajax
	// @GetMapping("/mypage/bookablereview")
	@RequestMapping(value="/mypage/bookablereview", produces="application/json;charset=UTF-8")
	@ResponseBody
	private String requestReview(String selected, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		List<BookableReviewDTO> b = new ArrayList<BookableReviewDTO>();

		if (selected.equals("accommodate"))
			b = service.getAccommodateReview(seq);
		else if (selected.equals("activity"))
			b = service.getActivityReview(seq);

		ObjectMapper mapper = new ObjectMapper();
		String jsonResponse;
		try {
			jsonResponse = mapper.writeValueAsString(b);
			return jsonResponse;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;

	}

	// 내 리뷰 조회 ajax - 맛집
	//@GetMapping("/mypage/unbookablereview")
	@RequestMapping(value="/mypage/unbookablereview", produces="application/json;charset=UTF-8")
	@ResponseBody
	private String requestReviewUB(String selected, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		List<UnbookableReviewDTO> ub = new ArrayList<UnbookableReviewDTO>(); // 맛집 리뷰
		ub = service.getFoodReview(seq);

		ObjectMapper mapper = new ObjectMapper();
		String jsonResponse;
		try {
			jsonResponse = mapper.writeValueAsString(ub);
			
			return jsonResponse;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	// 내 리뷰 업데이트 ajax
	@RequestMapping(value="/mypage/updatereview", produces="application/json;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	private void updateBookableReview(String seq, String selected, String newContent) {
		
		int result = -1;
		
		if(selected.equals("accommodate")||selected.equals("activity")) result = service.updatebr(seq, newContent);
		else if(selected.equals("restaurant")) result = service.updateubr(seq, newContent);
		
	}
	
	
	// 내 리뷰 삭제
	@PostMapping("/mypage/deletereview")
	@ResponseBody
	private void deletereview(String seq, String selected) {
		
		int result = -1;
		
		if(selected.equals("accommodate")||selected.equals("activity")) {
			result = service.setReviewStatus(seq);
			result = service.deletebr(seq);
		}
		else if(selected.equals("restaurant")) result = service.deleteubr(seq);
				
	}
	

	// 예약 목록
	@GetMapping("/mypage/mypage_reserve")
	private String mypage_reserve(Model model, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		model.addAttribute("tlist", service.transList(seq));
		model.addAttribute("alist", service.accommodateList(seq));
		model.addAttribute("aclist", service.activityList(seq));
		
		return "mypage/mypage_reserve";
	}

	// 예약 상세
	@GetMapping("/mypage/mypage_reserve_view")
	private String mypage_reserve_view(Model model, String pay_seq, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		model.addAttribute("tlist", service.treservedetail(pay_seq, seq));
		model.addAttribute("rlist", service.rreservedetail(pay_seq, seq));
    	model.addAttribute("alist", service.areservedetail(pay_seq, seq));
    	model.addAttribute("list", service.rpay(pay_seq));
		

		
		return "mypage/mypage_reserve_view";
	}
	
	@PostMapping("/mypage/mypage_reservedelok")
	private String mypage_reservedelok(Model model, String pay_seq) {


		
			int result = service.payDel(pay_seq);
		

		
		return "redirect:/mypage/mypage_reserve";
	}
	

	// 즐겨찾기
	@GetMapping("/mypage/mypage_bookmark")
	private String mypage_bookmark(Model model, HttpSession session) {

		String seq = (String) session.getAttribute("seq");
		
		model.addAttribute("list", service.bookmarkList(seq));

		return "mypage/mypage_bookmark";
	}

	// 내 작성글
	@GetMapping("/mypage/mypage_write")
	private String mypage_write(Model model, HttpSession session) {
		
		String seq = (String) session.getAttribute("seq");
		model.addAttribute("list", service.getmywrite(seq));
		
		return "mypage/mypage_write";

	}
	

	// 테스트
	@GetMapping("/mypage/mapmap")
	private String mapmap() {

		return "mypage/mapmap";

	}
	
	//테스트
	@PostMapping("/mypage/mapmapok")
	private String mapmapok(String placeName, String addressName) {
		
		return "redirect:/mypage/journey";
		
	}
	
	@PostMapping("/mypage/unregi")
	private String unregi(String member_seq, HttpSession session) {
		
		
		service.unregi(member_seq);

		session.invalidate();
		
		return "redirect:/index";
	}
	
	


	

}
