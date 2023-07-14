package com.test.service;

import java.util.List;

import com.test.domain.AccommodateDTO;
import com.test.domain.RoomDTO;
import com.test.domain.TrandateDTO;
import com.test.domain.TransportDTO;


public interface AccommodateService {

	List<AccommodateDTO> accommodatelist();
   
   List<AccommodateDTO> accommodatelist2();

	AccommodateDTO get(String acco_seq);

	List<RoomDTO> view(String acco_seq);
	

	List<TransportDTO> transportlist();

	List<TransportDTO> trainlist();

	List<TransportDTO> airplanelist();

	List<TrandateDTO> tranlist();
	
	
	TransportDTO tran_get(String tran_seq);
	
	List<TrandateDTO> tran_view(String tran_seq);

	List<AccommodateDTO> review(String acco_seq);

	String reviewCount(String acco_seq);

	void bookmark_on(String acco_seq);
	
	

	//Integer count() throws Exception;

	
	//게시물 목록 + 페이징
	//public List listPage(int displayPost, int postNum) throws Exception;

	
	
}
