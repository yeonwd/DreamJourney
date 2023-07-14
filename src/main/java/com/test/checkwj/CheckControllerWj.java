package com.test.checkwj;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;
import com.test.domain.AccommodateDTO;
import com.test.domain.ActivityDTO;
import com.test.domain.MemberDTO;
import com.test.emailwj.IamportClient;
import com.test.mapper.MemberMapper;

@Controller
public class CheckControllerWj {
	@Autowired
	private MemberMapper memberService;
	
	
	
	//가입되면 메인으로
	@PostMapping("/add")
	private String add(MemberDTO dto) {
	    // 회원 정보 추가
		memberService.addMember(dto);
	    return "index";
	}
	
	//회원탈퇴 되면 메인으로
	@PostMapping("/unresi")
	private String unresi(MemberDTO dto) {
	    // 회원 정보 추가
		System.out.println("회원탈퇴중");
		System.out.println(dto);	
		memberService.unMember(dto);
		System.out.println("탈퇴완료");
		System.out.println(dto);
	    return "index";
	}
	
	//전화번호 중복체크
	@PostMapping("/telCheck2")
	@ResponseBody
	public Map<String, Object> telCheck2(String imp_uid) {
		 Map<String, Object> response = new HashMap<>();

		IamportClient ic = new IamportClient("2420611866326071",
				"2BbxtAB6qFLcZpyM8LgdKF1k9cSm8PDYlwgL6ytR2dNrUaG9oDc8Ean5Yewu5s1hchm7iCOvZufH92bI");

		try {

			IamportResponse<Certification> certificationResponse = ic.certificationByImpUid(imp_uid);
			String tel = certificationResponse.getResponse().getPhone().toString();
			String birth = certificationResponse.getResponse().getBirth().toString();
			String name = certificationResponse.getResponse().getName().toString();
//			날짜를 1997-05-27로 변환
			 String strDate = null;
			 SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
			 SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			 
	            Date data;
				try {
					data = recvSimpleFormat.parse(birth);
		            strDate = tranSimpleFormat.format(data);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

//================================================================
//	       yyyy-mm-dd로 성인여부 판단
	         // 문자열을 LocalDate 객체로 변환
	            LocalDate date = LocalDate.parse(strDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	            
	         // 현재 날짜를 가져옴
	            LocalDate now = LocalDate.now();
	            
	         // 날짜를 기반으로 나이 계산
	            Period age = Period.between(date, now);
	            
	         // 성인 여부 판별
	            boolean isAdult = age.getYears() >= 18;
	            
	            
	            
	            // 결과 출력
	            if (isAdult) {
	                response.put("isAdult", true);
	            } else {
	                System.out.println("미성년자입니다.");
	                response.put("isAdult", false);
	                response.put("errorMessage", "미성년자는 가입하실 수 없습니다.");
	            }

			int cnt = memberService.telCheck2(tel);
	        if (cnt == 1) {
	        	 //사용할 수 없는 번호입니다
//	        	System.out.println("사용할 수 없는 번호입니다.");
	        	response.put("cnt", cnt);
	        } else {
	        	//데이터 넘겨주기(tel, name)
	        	response.put("tel", tel);
	        	response.put("name", name);
	        	response.put("cnt", cnt);
	        }

		} catch (IamportResponseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		   return response;
	}
	
	
	//숙소 검색하면 예약 페이지로
		@GetMapping("/search")
		public String search(AccommodateDTO dto, Model model) {
		    // 매개변수 처리 및 필요한 로직 수행
		    // ...
			
			System.out.println(dto.getAddress());
			System.out.println(dto.getLimit());
			
		    List<AccommodateDTO> accResult = memberService.searchAcc(dto); // 검색 결과를 받아옴

		    
		    // 검색 결과를 모델에 추가
		    model.addAttribute("accResult", accResult);
		    
		    System.out.println(accResult);
		    
		    // 검색 결과를 표시할 View 이름을 반환
		    return "reservation/accommodate";
		}
		
		//항공 검색하면 예약 페이지로
		@GetMapping("/searchairplane")
		public String searchairplane(AccommodateDTO dto, Model model) {
			// 매개변수 처리 및 필요한 로직 수행
			// ...
			
			System.out.println(dto.getDeparture());
			System.out.println(dto.getDestination());
			System.out.println(dto.getTran_date());
			System.out.println(dto.getLimit());
			
			List<AccommodateDTO> airplaneResult = memberService.searchAirplane(dto);
			System.out.println(airplaneResult);
			
			// 검색 결과를 모델에 추가
			model.addAttribute("airplaneResult", airplaneResult);
			
			// 검색 결과를 표시할 View 이름을 반환
			return "reservation/airplane";
		}
		
		//기차 검색하면 예약 페이지로
		@GetMapping("/searchtrain")
		public String searchtrain(AccommodateDTO dto, Model model) {
			// 매개변수 처리 및 필요한 로직 수행
			// ...
			
			System.out.println(dto.getDeparture());
			System.out.println(dto.getDestination());
			System.out.println(dto.getTran_date());
			System.out.println(dto.getLimit());
			
			List<AccommodateDTO> trainResult = memberService.searchTrain(dto);
			System.out.println(trainResult);
			
			// 검색 결과를 모델에 추가
			model.addAttribute("trainResult", trainResult);
			
			// 검색 결과를 표시할 View 이름을 반환
			return "reservation/train";
		}
			
		//버스 검색하면 예약 페이지로
		@GetMapping("/searchbus")
		public String searchbus(AccommodateDTO dto, Model model) {
			// 매개변수 처리 및 필요한 로직 수행
			// ...
			
			System.out.println(dto.getDeparture());
			System.out.println(dto.getDestination());
			System.out.println(dto.getTran_date());
			System.out.println(dto.getLimit());
			
			List<AccommodateDTO> busResult = memberService.searchBus(dto);
			System.out.println(busResult);
			
			// 검색 결과를 모델에 추가
			model.addAttribute("busResult", busResult);
			
			// 검색 결과를 표시할 View 이름을 반환
			return "reservation/transport";
		}
		
		//액티비티 검색
		@GetMapping("/activitywj")
		public String searchactivity(ActivityDTO dto, Model model) {
			//둘다 포함해서 검색
			if(dto.getAddress() != null && !dto.getAddress().isEmpty() && dto.getTitle() != null && !dto.getTitle().isEmpty()){
//				System.out.println("둘다");
				List<ActivityDTO> actResult = memberService.searchAct(dto);
				System.out.println(actResult);
				model.addAttribute("actResult", actResult);
			}
			
			//주소로만 검색
			else if(dto.getAddress() != null && !dto.getAddress().isEmpty()) {
//				System.out.println("주소만");
				List<ActivityDTO> actResultadr = memberService.searchActadr(dto);
				System.out.println(actResultadr);
				model.addAttribute("actResultadr", actResultadr);
				
				
			
			}
			
			//액티비티 명으로만 검색
			else if(dto.getTitle() != null && !dto.getTitle().isEmpty()) {
//				System.out.println("제목만");
				List<ActivityDTO> actResulttitle = memberService.searchActtitle(dto);
				System.out.println(actResulttitle);
				model.addAttribute("actResulttitle", actResulttitle);
			}
			
			
			
			// 검색 결과를 표시할 View 이름을 반환
			return "reservation/activity";
		}
		
	
}

