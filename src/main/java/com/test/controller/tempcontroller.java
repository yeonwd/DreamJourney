package com.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.domain.ScheduleDTO;
import com.test.domain.TripDTO;
import com.test.service.MypageService;

@Controller
public class tempcontroller {

	@Autowired
	private MypageService service;

	// 가입되면 메인으로
	@GetMapping("/board/share")
	private String share(Model model) {

		model.addAttribute("list", service.tripList());

		return "/board/share";
	}

	// 추천 여행 상세보기
	@GetMapping("/board/shareview")
	private String shareview(String trip_seq, Model model) {

		TripDTO dto = service.gettripview(trip_seq);

		System.out.println(dto.toString());

		String begin = dto.getBegin().substring(0, 10);
		String end = dto.getEnd().substring(0, 10);
		String regdate = dto.getRegdate().substring(0, 10);

		dto.setBegin(begin);
		dto.setEnd(end);
		dto.setRegdate(regdate);

		model.addAttribute("dto", dto);

		return "board/shareview";
	}

	// 여행 일수 계산
	@ResponseBody
	@GetMapping("/board/getdaybuttons")
	private String getdaybuttons(String seq) {
		return service.getDayButtons(seq);
	}

	// 일정 출력
	@ResponseBody
	@RequestMapping(value = "/board/getschedule", produces = "application/json;charset=UTF-8")
	private String getschedule(String seq, String day) {

		Map<String, String> map = new HashMap<String, String>();

		map.put("seq", seq);
		map.put("day", day);

		List<ScheduleDTO> list = service.getSchedule(map);
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
	
	
	// 추천 수 더하기
	@ResponseBody
	@PostMapping("/board/plusrecommend")
	private String plusrecommend(String seq) {
		
		int result = -1;
		result = service.plusrecommend(seq);
		TripDTO dto = service.gettripview(seq);
		
		
		return dto.getRecommend();
	}

}
