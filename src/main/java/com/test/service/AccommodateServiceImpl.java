package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.domain.AccommodateDTO;
import com.test.domain.RoomDTO;
import com.test.domain.TrandateDTO;
import com.test.domain.TransportDTO;
import com.test.mapper.AccommodateMapper;

@Service
public class AccommodateServiceImpl implements AccommodateService{

	
	@Autowired
	private AccommodateMapper mapper;
	
	@Override
	public List<AccommodateDTO> accommodatelist() {

		
		return mapper.accommodatelist();
	}

	@Override
	public AccommodateDTO get(String acco_seq) {

		return mapper.get(acco_seq);
	}

	@Override
	public List<RoomDTO> view(String acco_seq) {

		return mapper.view(acco_seq);
	}

	@Override
	public List<TransportDTO> transportlist() {
		
		return  mapper.transportlist();
	}

	@Override
	public List<TransportDTO> trainlist() {
		return  mapper.trainlist();
	}

	@Override
	public List<TransportDTO> airplanelist() {
		return  mapper.airplanelist();
	}

	@Override
	public List<TrandateDTO> tranlist() {
		
		return mapper.tranlist();
	}

	@Override
	public TransportDTO tran_get(String tran_seq) {

		return mapper.tran_get(tran_seq);
	}

	@Override
	public List<TrandateDTO> tran_view(String tran_seq) {

		return mapper.tran_view(tran_seq);
	}

	@Override
	public List<AccommodateDTO> review(String acco_seq) {

		return mapper.review(acco_seq);
	}

	@Override
	public String reviewCount(String acco_seq) {

		return mapper.reviewCount(acco_seq);
	}

	//즐겨찾기 추가
		@Override
		public void bookmark_on(String acco_seq) {
			mapper.bookmark_on(acco_seq);
			//System.out.println(acco_seq);
		}

	
	// 게시물 총 갯수
	/*
	@Override
	public Integer count() throws Exception {
	 return mapper.count(); 
	}
	*/
	
	
	//DAO 데이터를 주고 받으며 비즈니스 로직 수행
	
	@Override
	public List<AccommodateDTO> accommodatelist2() {
		 return mapper.accommodatelist2();
	}

   
   // 게시물 총 갯수
   /*
   @Override
   public Integer count() throws Exception {
    return mapper.count(); 
   }
   */
   
   
   //DAO 데이터를 주고 받으며 비즈니스 로직 수행
   
}
