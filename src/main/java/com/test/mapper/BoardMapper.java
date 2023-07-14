package com.test.mapper;

import java.util.List;

import com.test.domain.BoardDTO;
import com.test.domain.CommentDTO;

public interface BoardMapper {

	List<BoardDTO> getBlist();
	
	BoardDTO get(String free_seq);

	int updateReadCount(String free_seq);

	void edit(BoardDTO dto);

	void add(BoardDTO dto);

	void del(String free_seq);

	List<CommentDTO> getClist(String free_seq);

	void addComment(CommentDTO dto);

	int getCcount(String free_seq);

	void boardReport(String free_seq);

	CommentDTO getComment(String free_seq);

	void delComment(String free_seq);

	void editOkComment(CommentDTO dto);

	void boardRecommend(String free_seq);



	







}
