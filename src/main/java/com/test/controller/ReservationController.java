package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.AccommodateDTO;
import com.test.domain.RoomDTO;
import com.test.domain.TrandateDTO;
import com.test.domain.TransportDTO;
import com.test.service.AccommodateService;
import com.test.service.ActivityService;

@Controller
public class ReservationController {

	// 쓸 객체에 대해 컴포넌트는 보내고 오토와이어드는 받음
	// @Autowired //dao를 갖다쓸 수 있음
	// private ActivityDAO dao;



	@GetMapping("/reservation")
	private String reservation(Model model, HttpSession session) {
		model.addAttribute("list", aservice.activitylist());
		return "/reservation/reservation";
	}

	
	@Autowired
	private AccommodateService service;
	
	@Autowired
	private ActivityService aservice;
	
	
	@GetMapping("/reservation/accommodate")
	private String accommodate(Model model) {
		
		model.addAttribute("list", service.accommodatelist());

		return "/reservation/accommodate";
		
		/* API
		 * StringBuffer result = new StringBuffer(); String strResult = ""; try {
		 * 
		 * URL url = new URL(
		 * "https://apis.data.go.kr/6300000/openapi2022/tourroms/gettourroms?serviceKey=pJ3ffQfY7vj1VYW3G87Bv0c3fVedzE6G1zCpeaLtR%2BVpfyahW9Bjj8jsaEK%2BO5scs2DWSVc11NswaX3pJeqZTg%3D%3D&pageNo=8&numOfRows=8"
		 * ); HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		 * 
		 * // Request 형식 설정 conn.setRequestMethod("GET");
		 * conn.setRequestProperty("Content-Type", "application/json");
		 * 
		 * // 응답 데이터 받아오기 BufferedReader rd; if (conn.getResponseCode() >= 200 &
		 * conn.getResponseCode() <= 300) { rd = new BufferedReader(new
		 * InputStreamReader(conn.getInputStream(), "UTF-8")); } else { rd = new
		 * BufferedReader(new InputStreamReader(conn.getErrorStream())); }
		 * 
		 * String line; while ((line = rd.readLine()) != null) { result.append(line); }
		 * rd.close(); conn.disconnect(); strResult = result.toString(); } catch
		 * (Exception e) { e.printStackTrace(); }
		 * 
		 * model.addAttribute("result", strResult);
		 */

	}

	@GetMapping("/reservation/accommodate_detail")
	private String accommodate_detail(Model model, String acco_seq) {
		
		AccommodateDTO dto = service.get(acco_seq);
		List<RoomDTO> list = service.view(acco_seq);
		List<AccommodateDTO> rdto = service.review(acco_seq);	//리뷰
		String rcount = service.reviewCount(acco_seq);	//리뷰 수 
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("review", rdto);
		model.addAttribute("reviewCount", rcount);
		//System.out.println(rcount);
		
		return "/reservation/accommodate_detail";
	}
	
	@GetMapping("/reservation/transport_detail")
	private String transport_detail(Model model, String tran_seq) {
		
		TransportDTO tran_dto = service.tran_get(tran_seq);
		List<TrandateDTO> tran_list = service.tran_view(tran_seq);
		
		model.addAttribute("dto", tran_dto);
		model.addAttribute("list", tran_list);
		
		return "/reservation/transport_detail";
	}
	
	@GetMapping("/reservation/train_detail")
	private String train_detail(Model model, String tran_seq) {
		
		TransportDTO tran_dto = service.tran_get(tran_seq);
		List<TrandateDTO> tran_list = service.tran_view(tran_seq);
		
		model.addAttribute("dto", tran_dto);
		model.addAttribute("list", tran_list);
		
		return "/reservation/train_detail";
	}
	
	@GetMapping("/reservation/airplane_detail")
	private String airplane_detail(Model model, String tran_seq) {
		
		TransportDTO tran_dto = service.tran_get(tran_seq);
		List<TrandateDTO> tran_list = service.tran_view(tran_seq);
		
		model.addAttribute("dto", tran_dto);
		model.addAttribute("list", tran_list);
		
		return "/reservation/airplane_detail";
	}

	@GetMapping("/reservation/transport")
	private String transport(Model model) throws Exception {

		//Integer cnt = service.count();
		
		model.addAttribute("list", service.transportlist());
		
		return "/reservation/transport";
	}


	@GetMapping("/reservation/train")
	private String train(Model model) {

		model.addAttribute("list", service.trainlist());
		
		return "/reservation/train";
	}
	
	@GetMapping("/reservation/airplane")
	private String airplane(Model model) {
		
		model.addAttribute("list", service.airplanelist());
		
		return "/reservation/airplane";
	}
	
	//즐겨찾기
		@PostMapping("/reservation/accommodate_detail")
		@ResponseBody
		public void bookmark_on(@RequestParam("acco_seq") String acco_seq) {
		    //System.out.println("성공");
		    //System.out.println(acco_seq);
		    
		    service.bookmark_on(acco_seq);
		}
	
		
	
	// 게시물 목록 + 페이징 추가
	/*
	 * public void getListPage(Model model) throws Exception {
	 * 
	 * List list = null; list = service.list(); model.addAttribute("list", list); }
	 */
	
	
}
